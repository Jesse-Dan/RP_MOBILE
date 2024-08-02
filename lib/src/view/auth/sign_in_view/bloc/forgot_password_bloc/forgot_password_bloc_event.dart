// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:developer' as developer;

import 'package:recenth_posts/src/view/auth/sign_in_view/bloc/forgot_password_bloc/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ForgotPasswordBlocEvent {
  Stream<ForgotPasswordBlocState> applyAsync(
      {ForgotPasswordBlocState currentState, ForgotPasswordBlocBloc bloc});
}

class UnForgotPasswordBlocEvent extends ForgotPasswordBlocEvent {
  @override
  Stream<ForgotPasswordBlocState> applyAsync(
      {ForgotPasswordBlocState? currentState,
      ForgotPasswordBlocBloc? bloc}) async* {
    yield const UnForgotPasswordBlocState();
  }
}

class LoadForgotPasswordBlocEvent extends ForgotPasswordBlocEvent {
  @override
  Stream<ForgotPasswordBlocState> applyAsync(
      {ForgotPasswordBlocState? currentState,
      ForgotPasswordBlocBloc? bloc}) async* {
    try {
      yield const UnForgotPasswordBlocState();
      await Future.delayed(const Duration(seconds: 1));
      yield const InForgotPasswordBlocState('Hello world');
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadForgotPasswordBlocEvent',
          error: _,
          stackTrace: stackTrace);
      yield ErrorForgotPasswordBlocState(_.toString());
    }
  }
}
