// ignore_for_file: depend_on_referenced_packages

import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:recenth_posts/src/view/auth/sign_in_view/bloc/set_new_password_bloc/index.dart';

class SetNewPasswordBlocBloc
    extends Bloc<SetNewPasswordBlocEvent, SetNewPasswordBlocState> {
  SetNewPasswordBlocBloc(SetNewPasswordBlocState initialState)
      : super(initialState) {
    on<SetNewPasswordBlocEvent>((event, emit) {
      return emit.forEach<SetNewPasswordBlocState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error',
              name: 'SetNewPasswordBlocBloc',
              error: error,
              stackTrace: stackTrace);
          return ErrorSetNewPasswordBlocState(error.toString());
        },
      );
    });
  }
}
