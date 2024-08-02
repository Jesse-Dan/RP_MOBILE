// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;

import 'package:recenth_posts/src/logic/repository/auth/auth_repo.dart';
import 'package:recenth_posts/src/logic/services/location_service/local_storage_service.dart';
import 'package:recenth_posts/src/logic/services/logger/logger.dart';
import 'package:recenth_posts/src/utils/constants/global_constants.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:recenth_posts/src/view/auth/sign_in_view/bloc/sign_in_bloc/index.dart';
import 'package:recenth_posts/src/view/auth/sign_in_view/models/signin_payload.dart';
import 'package:recenth_posts/src/view/auth/sign_in_view/models/signin_response.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SignInBlocEvent {
  Stream<SignInBlocState> applyAsync(
      {SignInBlocState currentState, SignInBlocBloc bloc});
}

class LoginEvent extends SignInBlocEvent {
  final SigninPayload signinPayload;

  LoginEvent({required this.signinPayload});

  @override
  Stream<SignInBlocState> applyAsync(
      {SignInBlocState? currentState, SignInBlocBloc? bloc}) async* {
    try {
      yield const LoadingSignInBlocState();
      var res = await AuthRepository().login(signinPayload: signinPayload);
      if (res.$1?['message'] == 'Login successful!' ||
          res.$1?['message'] ==
              'Logged in successful. Please Validate Account') {
        var response = SigninResponse.fromJson(res.$1!);
        Logger.log(tag: Tag.DEBUG, message: response.data?.token ?? '');
        LocalStorageService.setString(
            GlobalConstants.BEARER_TOKEN, response.data?.token ?? '');
        LocalStorageService.setString(
            GlobalConstants.USER, jsonEncode(response.data?.user?.toJson()));

        yield SuccessfullSignInBlocState(response);
      } else {
        yield ErrorSignInBlocState(res.$3);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadSignInBlocEvent', error: _, stackTrace: stackTrace);
      yield ErrorSignInBlocState(_.toString());
    }
  }
}
