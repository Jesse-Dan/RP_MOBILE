// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:developer' as developer;

import 'package:recenth_posts/src/view/auth/sign_in_view/bloc/set_new_password_bloc/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SetNewPasswordBlocEvent {
  Stream<SetNewPasswordBlocState> applyAsync(
      {SetNewPasswordBlocState currentState, SetNewPasswordBlocBloc bloc});
}

class UnSetNewPasswordBlocEvent extends SetNewPasswordBlocEvent {
  @override
  Stream<SetNewPasswordBlocState> applyAsync(
      {SetNewPasswordBlocState? currentState,
      SetNewPasswordBlocBloc? bloc}) async* {
    yield const UnSetNewPasswordBlocState();
  }
}

class LoadSetNewPasswordBlocEvent extends SetNewPasswordBlocEvent {
  @override
  Stream<SetNewPasswordBlocState> applyAsync(
      {SetNewPasswordBlocState? currentState,
      SetNewPasswordBlocBloc? bloc}) async* {
    try {
      yield const UnSetNewPasswordBlocState();
      await Future.delayed(const Duration(seconds: 1));
      yield const InSetNewPasswordBlocState('Hello world');
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadSetNewPasswordBlocEvent',
          error: _,
          stackTrace: stackTrace);
      yield ErrorSetNewPasswordBlocState(_.toString());
    }
  }
}
