// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:developer' as developer;

import 'package:recenth_posts/src/view/auth/sign_up_view/model/res/otp_sent_response.dart';
import 'package:meta/meta.dart';

import '../../../../../logic/repository/auth/auth_repo.dart';
import 'send_otp_bloc.dart';
import 'send_otp_state.dart';

@immutable
abstract class SignUpSendOtpBlocEvent {
  Stream<SignUpSendOtpBlocState> applyAsync(
      {SignUpSendOtpBlocState currentState, SignUpSendOtpBloc bloc});
}

class UnSendOtpBlocEvent extends SignUpSendOtpBlocEvent {
  @override
  Stream<SignUpSendOtpBlocState> applyAsync(
      {SignUpSendOtpBlocState? currentState, SignUpSendOtpBloc? bloc}) async* {
    yield const SignUpInitialSendOtpState();
  }
}

class SendOtpBlocEvent extends SignUpSendOtpBlocEvent {
  final String email;

  SendOtpBlocEvent({required this.email});

  @override
  Stream<SignUpSendOtpBlocState> applyAsync(
      {SignUpSendOtpBlocState? currentState, SignUpSendOtpBloc? bloc}) async* {
    try {
      yield const SignUpLoadingSendOtpState();
      var res = await AuthRepository().sendOtp(email: email);

      if (res.$1?['message'] != 'User Created Successfully') {
        yield SignUpErrorSendOtpBlocState(res.$3);
      } else {
        var response = OtpSentResponse.fromJson(res.$1!);
        yield SignUpSeucessfullSendOtpBlocState(response);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadSendOtpBlocEvent', error: _, stackTrace: stackTrace);
      yield SignUpErrorSendOtpBlocState(_.toString());
    }
  }
}
