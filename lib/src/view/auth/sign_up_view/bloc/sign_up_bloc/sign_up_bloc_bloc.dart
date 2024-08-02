// ignore_for_file: depend_on_referenced_packages

import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';

import 'sign_up_bloc_event.dart';
import 'sign_up_bloc_state.dart';

class SignUpBlocBloc extends Bloc<SignUpBlocEvent, SignUpBlocState> {

  SignUpBlocBloc(SignUpBlocState initialState) : super(initialState){
   on<SignUpBlocEvent>((event, emit) {
      return emit.forEach<SignUpBlocState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error', name: 'SignUpBlocBloc', error: error, stackTrace: stackTrace);
          return ErrorSignUpBlocState(error.toString());
        },
      );
    });
  }
}
