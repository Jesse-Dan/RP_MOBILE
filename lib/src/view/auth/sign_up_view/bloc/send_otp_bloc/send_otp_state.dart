import 'package:recenth_posts/src/view/auth/sign_up_view/model/res/otp_sent_response.dart';
import 'package:equatable/equatable.dart';

abstract class SignUpSendOtpBlocState extends Equatable {
  const SignUpSendOtpBlocState();

  @override
  List<Object> get props => [];
}

/// UnInitialized
class SignUpInitialSendOtpState extends SignUpSendOtpBlocState {
  const SignUpInitialSendOtpState();

  @override
  String toString() => 'UnSendOtpBlocState';
}

/// UnInitialized
class SignUpLoadingSendOtpState extends SignUpSendOtpBlocState {
  const SignUpLoadingSendOtpState();

  @override
  String toString() => 'UnSendOtpBlocState';
}

/// Initialized
class SignUpSeucessfullSendOtpBlocState extends SignUpSendOtpBlocState {
  const SignUpSeucessfullSendOtpBlocState(this.otpSentResponse);

  final OtpSentResponse otpSentResponse;

  @override
  String toString() => 'InSendOtpBlocState $otpSentResponse';

  @override
  List<Object> get props => [otpSentResponse];
}

class SignUpErrorSendOtpBlocState extends SignUpSendOtpBlocState {
  const SignUpErrorSendOtpBlocState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorSendOtpBlocState';

  @override
  List<Object> get props => [errorMessage];
}
