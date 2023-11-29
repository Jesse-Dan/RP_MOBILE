// ignore_for_file: depend_on_referenced_packages, unnecessary_null_comparison

import 'dart:async';
import 'dart:developer' as developer;

import 'package:meta/meta.dart';
import 'package:recenth_posts/src/logic/models/auth/auth/login/login_response.dart';
import 'package:recenth_posts/src/logic/models/auth/auth/reg/reg_response.dart';
import 'package:recenth_posts/src/logic/models/service/un_auth_response.dart';
import 'package:recenth_posts/src/logic/services/logger/logger.dart';
import 'package:recenth_posts/src/logic/services/storage_service/local_storage_service.dart';
import 'package:recenth_posts/src/utils/constants/global_constants.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';

import '../../models/auth/auth/login/login_payload.dart';
import '../../models/auth/auth/reg/reg_error_response.dart';
import '../../models/auth/auth/reg/reg_payload.dart';
import '../../repository/auth/auth_repo.dart';
import 'auth_bloc.dart';
import 'auth_state.dart';

@immutable
abstract class AuthEvent {
  Stream<AuthState> applyAsync({AuthState currentState, AuthBloc bloc});
}

class UserLoginEvent extends AuthEvent {
  final AuthRepository authRepository;
  final LoginPayload loginPayload;
  static final LocalStgService _localStgService = LocalStgService();

  UserLoginEvent(this.authRepository, {required this.loginPayload});
  @override
  Stream<AuthState> applyAsync(
      {AuthState? currentState, AuthBloc? bloc}) async* {
    try {
      yield const AuthLoadingState();
      var res = await authRepository.login(loginPayload: loginPayload);
      Logger(tag: Tag.CALLBACK, message: res.$1.toString());
      if (res.$2 == ResponseType.Success) {
        var data = LoginResponse.fromJson(res.$1!);
        await _localStgService.saveData(
            GlobalConstants.BEARER_TOKEN, data.data?.token);
        Logger(
            tag: Tag.CALLBACK,
            message: _localStgService.getData(GlobalConstants.BEARER_TOKEN));
        yield LoginLoadedState(postResponses: data);
      }

      if (res.$1 == null) {
        Logger.log(tag: Tag.ERROR, message: 'UNKNOWN ERROR OCCURED');
        yield const AuthErrorState('UNKNOWN ERROR OCCURED');
      }

      if (res.$2 == ResponseType.Error) {
        if (res.$1!['statusCode'] == 401) {
          var err = GeneralErrorResponse.fromJson(res.$1!);
          yield AuthErrorState(err.message!);
        } else {
          Logger.log(tag: Tag.ERROR, message: res.toString());
          var err = FieldErrorResponse.fromJson(res.$1!);
          Message? msg = err.message;
          var message = getFirstNonNullItem(msg!.toJson());
          yield AuthErrorState(message);
        }
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadLoginEvent', error: _, stackTrace: stackTrace);
      yield AuthErrorState(_.toString());
    }
  }
}

class UserRegEvent extends AuthEvent {
  final AuthRepository authRepository;
  final RegPayload regPayload;
  UserRegEvent(this.authRepository, {required this.regPayload});
  @override
  Stream<AuthState> applyAsync(
      {AuthState? currentState, AuthBloc? bloc}) async* {
    try {
      yield const AuthLoadingState();
      var res = await authRepository.register(regPayload: regPayload);
      if (res.$2 == ResponseType.Success) {
        yield RegLoadedState(regResponse: RegResponse.fromJson(res.$1!));
      }
      if (res.$1 == null) {
        Logger.log(tag: Tag.ERROR, message: 'UNKNOWN ERROR OCCURED');
        yield const AuthErrorState('UNKNOWN ERROR OCCURED');
      }

      if (res.$2 == ResponseType.Error) {
        if (res.$1!['statusCode'] == 401 ||
            res.$1!['statusCode'] == 500 ||
            res.$1!['statusCode'] == 409) {
          var err = GeneralErrorResponse.fromJson(res.$1!);
          yield AuthErrorState(err.message!);
        } else {
          Logger.log(tag: Tag.ERROR, message: res.toString());
          var err = FieldErrorResponse.fromJson(res.$1!);
          Message? msg = err.message;
          var message = getFirstNonNullItem(msg!.toJson());
          yield AuthErrorState(message);
        }
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadRegistrationEvent', error: _, stackTrace: stackTrace);
      yield AuthErrorState(_.toString());
    }
  }
}

String getFirstNonNullItem(Map<String, dynamic> params) {
  final StringBuffer result = StringBuffer();

  params.forEach((key, value) {
    if ((value as List).isNotEmpty) {
      result.writeln(value[0]);
    }
  });

  return result.toString();
}
