// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:developer' as developer;

import 'package:meta/meta.dart';

import 'resend_otp_bloc.dart';
import 'resend_otp_state.dart';

@immutable
abstract class SignUpResendOtpBlocEvent {
  Stream<SignUpResendOtpBlocState> applyAsync(
      {SignUpResendOtpBlocState currentState,
      SignUpResendOtpBloc bloc});
}

class UnResendOtpBlocEvent extends SignUpResendOtpBlocEvent {
  @override
  Stream<SignUpResendOtpBlocState> applyAsync(
      {SignUpResendOtpBlocState? currentState,
      SignUpResendOtpBloc? bloc}) async* {
    yield const SignUpInitialResendOtpState();
  }
}

class LoadResendOtpBlocEvent extends SignUpResendOtpBlocEvent {
  @override
  Stream<SignUpResendOtpBlocState> applyAsync(
      {SignUpResendOtpBlocState? currentState,
      SignUpResendOtpBloc? bloc}) async* {
    try {
      yield const SignUpInitialResendOtpState();
      await Future.delayed(const Duration(seconds: 1));
      yield const SignUpSeucessfullResendOtpBlocState('Hello world');
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadResendOtpBlocEvent',
          error: _,
          stackTrace: stackTrace);
      yield SignUpErrorResendOtpBlocState(_.toString());
    }
  }
}
