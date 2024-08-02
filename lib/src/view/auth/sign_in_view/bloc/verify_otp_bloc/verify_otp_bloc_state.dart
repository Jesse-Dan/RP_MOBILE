import 'package:equatable/equatable.dart';

abstract class VerifyOtpBlocState extends Equatable {
  const VerifyOtpBlocState();

  @override
  List<Object> get props => [];
}

/// UnInitialized
class UnVerifyOtpBlocState extends VerifyOtpBlocState {

  const UnVerifyOtpBlocState();

  @override
  String toString() => 'UnVerifyOtpBlocState';
}

/// Initialized
class InVerifyOtpBlocState extends VerifyOtpBlocState {
  const InVerifyOtpBlocState(this.hello);
  
  final String hello;

  @override
  String toString() => 'InVerifyOtpBlocState $hello';

  @override
  List<Object> get props => [hello];
}

class ErrorVerifyOtpBlocState extends VerifyOtpBlocState {
  const ErrorVerifyOtpBlocState(this.errorMessage);
 
  final String errorMessage;
  
  @override
  String toString() => 'ErrorVerifyOtpBlocState';

  @override
  List<Object> get props => [errorMessage];
}
