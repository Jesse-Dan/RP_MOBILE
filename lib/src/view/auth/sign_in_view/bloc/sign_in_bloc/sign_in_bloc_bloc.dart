// ignore_for_file: depend_on_referenced_packages

import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:recenth_posts/src/view/auth/sign_in_view/bloc/sign_in_bloc/index.dart';

class SignInBlocBloc extends Bloc<SignInBlocEvent, SignInBlocState> {
  SignInBlocBloc(SignInBlocState initialState) : super(initialState) {
    on<SignInBlocEvent>((event, emit) {
      return emit.forEach<SignInBlocState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error',
              name: 'SignInBlocBloc', error: error, stackTrace: stackTrace);
          return ErrorSignInBlocState(error.toString());
        },
      );
    });
  }
}
