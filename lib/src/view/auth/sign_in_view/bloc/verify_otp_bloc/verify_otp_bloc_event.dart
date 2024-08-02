// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:developer' as developer;

import 'package:meta/meta.dart';

import 'verify_otp_bloc_bloc.dart';
import 'verify_otp_bloc_state.dart';

@immutable
abstract class VerifyOtpBlocEvent {
  Stream<VerifyOtpBlocState> applyAsync(
      {VerifyOtpBlocState currentState, VerifyOtpBlocBloc bloc});
}

class UnVerifyOtpBlocEvent extends VerifyOtpBlocEvent {
  @override
  Stream<VerifyOtpBlocState> applyAsync({VerifyOtpBlocState? currentState, VerifyOtpBlocBloc? bloc}) async* {
    yield const UnVerifyOtpBlocState();
  }
}

class LoadVerifyOtpBlocEvent extends VerifyOtpBlocEvent {
   
  @override
  Stream<VerifyOtpBlocState> applyAsync(
      {VerifyOtpBlocState? currentState, VerifyOtpBlocBloc? bloc}) async* {
    try {
      yield const UnVerifyOtpBlocState();
      await Future.delayed(const Duration(seconds: 1));
      yield const InVerifyOtpBlocState('Hello world');
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadVerifyOtpBlocEvent', error: _, stackTrace: stackTrace);
      yield ErrorVerifyOtpBlocState( _.toString());
    }
  }
}
