import 'package:recenth_posts/src/view/auth/sign_up_view/model/res/signup_response.dart';
import 'package:equatable/equatable.dart';

abstract class SignUpBlocState extends Equatable {
  const SignUpBlocState();

  @override
  List<Object> get props => [];
}

/// Initialized
class InitialSignUpState extends SignUpBlocState {
  const InitialSignUpState();

  @override
  String toString() => 'UnSignUpBlocState';
}

/// Loading
class LoadingSignUpState extends SignUpBlocState {
  const LoadingSignUpState();

  @override
  String toString() => 'UnSignUpBlocState';
}

/// Success
class SignUpSuccessfullState extends SignUpBlocState {
  const SignUpSuccessfullState(this.signUpResponse);

  final SignUpResponse signUpResponse;

  @override
  String toString() => 'InSignUpBlocState $signUpResponse';

  @override
  List<Object> get props => [signUpResponse];
}

class ErrorSignUpBlocState extends SignUpBlocState {
  const ErrorSignUpBlocState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorSignUpBlocState';

  @override
  List<Object> get props => [errorMessage];
}
