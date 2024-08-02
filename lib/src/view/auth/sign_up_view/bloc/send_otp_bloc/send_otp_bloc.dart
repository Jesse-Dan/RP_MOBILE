// ignore_for_file: depend_on_referenced_packages

import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';

import 'send_otp_event.dart';
import 'send_otp_state.dart';

class SignUpSendOtpBloc
    extends Bloc<SignUpSendOtpBlocEvent, SignUpSendOtpBlocState> {
  SignUpSendOtpBloc(SignUpSendOtpBlocState initialState)
      : super(initialState) {
    on<SignUpSendOtpBlocEvent>((event, emit) {
      return emit.forEach<SignUpSendOtpBlocState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error',
              name: 'SendOtpBlocBloc',
              error: error,
              stackTrace: stackTrace);
          return SignUpErrorSendOtpBlocState(error.toString());
        },
      );
    });
  }
}
