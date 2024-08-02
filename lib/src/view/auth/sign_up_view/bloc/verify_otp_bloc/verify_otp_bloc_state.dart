import 'package:equatable/equatable.dart';

import '../../model/res/signup_process_complete_response.dart';

abstract class SignUpVerifyOtpBlocState extends Equatable {
  const SignUpVerifyOtpBlocState();

  @override
  List<Object> get props => [];
}

/// UnInitialized
class SignUpInitialVerifyOtpState extends SignUpVerifyOtpBlocState {
  const SignUpInitialVerifyOtpState();

  @override
  String toString() => 'UnVerifyOtpBlocState';
}

/// UnInitialized
class SignUpLoadingVerifyOtpBlocState extends SignUpVerifyOtpBlocState {
  const SignUpLoadingVerifyOtpBlocState();

  @override
  String toString() => 'UnVerifyOtpBlocState';
}

/// Initialized
class SignUpSuccessfullVerifyOtpBlocState extends SignUpVerifyOtpBlocState {
  const SignUpSuccessfullVerifyOtpBlocState(this.signUpProcessCompleteResponse);

  final SignUpProcessCompleteResponse signUpProcessCompleteResponse;

  @override
  String toString() => 'InVerifyOtpBlocState $signUpProcessCompleteResponse';

  @override
  List<Object> get props => [signUpProcessCompleteResponse];
}

class ErrorVerifyOtpBlocState extends SignUpVerifyOtpBlocState {
  const ErrorVerifyOtpBlocState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorVerifyOtpBlocState';

  @override
  List<Object> get props => [errorMessage];
}
