// ignore_for_file: depend_on_referenced_packages

import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';

import 'verify_otp_bloc_event.dart';
import 'verify_otp_bloc_state.dart';

class SignUpVerifyOtpBloc
    extends Bloc<SignUpVerifyOtpBlocEvent, SignUpVerifyOtpBlocState> {
  SignUpVerifyOtpBloc(SignUpVerifyOtpBlocState initialState)
      : super(initialState) {
    on<SignUpVerifyOtpBlocEvent>((event, emit) {
      return emit.forEach<SignUpVerifyOtpBlocState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error',
              name: 'VerifyOtpBlocBloc', error: error, stackTrace: stackTrace);
          return ErrorVerifyOtpBlocState(error.toString());
        },
      );
    });
  }
}
