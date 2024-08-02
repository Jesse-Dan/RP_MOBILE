import 'package:equatable/equatable.dart';

abstract class ForgotPasswordBlocState extends Equatable {
  const ForgotPasswordBlocState();

  @override
  List<Object> get props => [];
}

/// UnInitialized
class UnForgotPasswordBlocState extends ForgotPasswordBlocState {

  const UnForgotPasswordBlocState();

  @override
  String toString() => 'UnForgotPasswordBlocState';
}

/// Initialized
class InForgotPasswordBlocState extends ForgotPasswordBlocState {
  const InForgotPasswordBlocState(this.hello);
  
  final String hello;

  @override
  String toString() => 'InForgotPasswordBlocState $hello';

  @override
  List<Object> get props => [hello];
}

class ErrorForgotPasswordBlocState extends ForgotPasswordBlocState {
  const ErrorForgotPasswordBlocState(this.errorMessage);
 
  final String errorMessage;
  
  @override
  String toString() => 'ErrorForgotPasswordBlocState';

  @override
  List<Object> get props => [errorMessage];
}
