// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;

import 'package:recenth_posts/src/logic/services/location_service/local_storage_service.dart';
import 'package:recenth_posts/src/utils/constants/global_constants.dart';
import 'package:recenth_posts/src/view/auth/sign_up_view/model/payload/verify_otp_payload.dart';
import 'package:recenth_posts/src/view/auth/sign_up_view/model/res/signup_process_complete_response.dart';
import 'package:meta/meta.dart';

import '../../../../../logic/repository/auth/auth_repo.dart';
import 'verify_otp_bloc_bloc.dart';
import 'verify_otp_bloc_state.dart';

@immutable
abstract class SignUpVerifyOtpBlocEvent {
  Stream<SignUpVerifyOtpBlocState> applyAsync(
      {SignUpVerifyOtpBlocState currentState, SignUpVerifyOtpBloc bloc});
}

class UnVerifyOtpBlocEvent extends SignUpVerifyOtpBlocEvent {
  @override
  Stream<SignUpVerifyOtpBlocState> applyAsync(
      {SignUpVerifyOtpBlocState? currentState,
      SignUpVerifyOtpBloc? bloc}) async* {
    yield const SignUpInitialVerifyOtpState();
  }
}

class LoadVerifyOtpBlocEvent extends SignUpVerifyOtpBlocEvent {
  final VerifyOtpPayload verifyOtpPayload;

  LoadVerifyOtpBlocEvent({required this.verifyOtpPayload});
  @override
  Stream<SignUpVerifyOtpBlocState> applyAsync(
      {SignUpVerifyOtpBlocState? currentState,
      SignUpVerifyOtpBloc? bloc}) async* {
    try {
      yield const SignUpLoadingVerifyOtpBlocState();
      var res =
          await AuthRepository().verifyOtp(verifyOtpPayload: verifyOtpPayload);
      if (res.$1?['message'] == 'Email verified successfully') {
        var response = SignUpProcessCompleteResponse.fromJson(res.$1!);
        LocalStorageService.setString(
            GlobalConstants.BEARER_TOKEN, response.data.token);
        LocalStorageService.setString(
            GlobalConstants.USER, jsonEncode(response.data.user.toJson()));
        yield SignUpSuccessfullVerifyOtpBlocState(response);
      } else {
        yield ErrorVerifyOtpBlocState(res.$3);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadVerifyOtpBlocEvent', error: _, stackTrace: stackTrace);
      yield ErrorVerifyOtpBlocState(_.toString());
    }
  }
}
