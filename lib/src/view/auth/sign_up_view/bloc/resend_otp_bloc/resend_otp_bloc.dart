// ignore_for_file: depend_on_referenced_packages

import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';

import 'resend_otp_event.dart';
import 'resend_otp_state.dart';

class SignUpResendOtpBloc
    extends Bloc<SignUpResendOtpBlocEvent, SignUpResendOtpBlocState> {
  SignUpResendOtpBloc(SignUpResendOtpBlocState initialState)
      : super(initialState) {
    on<SignUpResendOtpBlocEvent>((event, emit) {
      return emit.forEach<SignUpResendOtpBlocState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error',
              name: 'ResendOtpBlocBloc',
              error: error,
              stackTrace: stackTrace);
          return SignUpErrorResendOtpBlocState(error.toString());
        },
      );
    });
  }
}
