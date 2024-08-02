import 'package:equatable/equatable.dart';

abstract class SetNewPasswordBlocState extends Equatable {
  const SetNewPasswordBlocState();

  @override
  List<Object> get props => [];
}

/// UnInitialized
class UnSetNewPasswordBlocState extends SetNewPasswordBlocState {

  const UnSetNewPasswordBlocState();

  @override
  String toString() => 'UnSetNewPasswordBlocState';
}

/// Initialized
class InSetNewPasswordBlocState extends SetNewPasswordBlocState {
  const InSetNewPasswordBlocState(this.hello);
  
  final String hello;

  @override
  String toString() => 'InSetNewPasswordBlocState $hello';

  @override
  List<Object> get props => [hello];
}

class ErrorSetNewPasswordBlocState extends SetNewPasswordBlocState {
  const ErrorSetNewPasswordBlocState(this.errorMessage);
 
  final String errorMessage;
  
  @override
  String toString() => 'ErrorSetNewPasswordBlocState';

  @override
  List<Object> get props => [errorMessage];
}
