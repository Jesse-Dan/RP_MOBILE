// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:developer' as developer;

import 'package:recenth_posts/src/logic/repository/auth/auth_repo.dart';
import 'package:recenth_posts/src/view/auth/sign_up_view/model/payload/signup_payload.dart';
import 'package:recenth_posts/src/view/auth/sign_up_view/model/res/signup_response.dart';
import 'package:meta/meta.dart';

import 'sign_up_bloc_bloc.dart';
import 'sign_up_bloc_state.dart';

@immutable
abstract class SignUpBlocEvent {
  Stream<SignUpBlocState> applyAsync(
      {SignUpBlocState currentState, SignUpBlocBloc bloc});
}

class UnSignUpBlocEvent extends SignUpBlocEvent {
  @override
  Stream<SignUpBlocState> applyAsync(
      {SignUpBlocState? currentState, SignUpBlocBloc? bloc}) async* {
    yield const InitialSignUpState();
  }
}

class LoadSignUpBlocEvent extends SignUpBlocEvent {
  final SignUpPayload signUpPayload;

  LoadSignUpBlocEvent({required this.signUpPayload});

  @override
  Stream<SignUpBlocState> applyAsync(
      {SignUpBlocState? currentState, SignUpBlocBloc? bloc}) async* {
    try {
      yield const LoadingSignUpState();
      var res = await AuthRepository().register(signUpPayload: signUpPayload);
      if (res.$1?['message'] ==
          'User already exists, Please validate your account') {
        var response = SignUpResponse.fromJson(res.$1!);

        yield SignUpSuccessfullState(response);
      } else if (res.$1?['message'] == 'User Created Successfully') {
        var response = SignUpResponse.fromJson(res.$1!);
        yield SignUpSuccessfullState(response);
      } else {
        yield ErrorSignUpBlocState(res.$3);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadSignUpBlocEvent', error: _, stackTrace: stackTrace);
      yield ErrorSignUpBlocState(_.toString());
    }
  }
}
