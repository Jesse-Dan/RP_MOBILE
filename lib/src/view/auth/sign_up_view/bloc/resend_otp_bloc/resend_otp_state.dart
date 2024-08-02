import 'package:equatable/equatable.dart';

abstract class SignUpResendOtpBlocState extends Equatable {
  const SignUpResendOtpBlocState();

  @override
  List<Object> get props => [];
}

/// UnInitialized
class SignUpInitialResendOtpState extends SignUpResendOtpBlocState {
  const SignUpInitialResendOtpState();

  @override
  String toString() => 'UnResendOtpBlocState';
}

/// UnInitialized
class SignUpLoadingResendOtpBlocState
    extends SignUpResendOtpBlocState {
  const SignUpLoadingResendOtpBlocState();

  @override
  String toString() => 'UnResendOtpBlocState';
}

/// Initialized
class SignUpSeucessfullResendOtpBlocState
    extends SignUpResendOtpBlocState {
  const SignUpSeucessfullResendOtpBlocState(this.hello);

  final String hello;

  @override
  String toString() => 'InResendOtpBlocState $hello';

  @override
  List<Object> get props => [hello];
}

class SignUpErrorResendOtpBlocState extends SignUpResendOtpBlocState {
  const SignUpErrorResendOtpBlocState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorResendOtpBlocState';

  @override
  List<Object> get props => [errorMessage];
}
