// ignore_for_file: depend_on_referenced_packages

import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:recenth_posts/src/view/auth/sign_in_view/bloc/forgot_password_bloc/index.dart';

class ForgotPasswordBlocBloc
    extends Bloc<ForgotPasswordBlocEvent, ForgotPasswordBlocState> {
  ForgotPasswordBlocBloc(ForgotPasswordBlocState initialState)
      : super(initialState) {
    on<ForgotPasswordBlocEvent>((event, emit) {
      return emit.forEach<ForgotPasswordBlocState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error',
              name: 'ForgotPasswordBlocBloc',
              error: error,
              stackTrace: stackTrace);
          return ErrorForgotPasswordBlocState(error.toString());
        },
      );
    });
  }
}
