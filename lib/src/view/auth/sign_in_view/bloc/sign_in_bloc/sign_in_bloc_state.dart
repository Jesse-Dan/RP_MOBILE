import 'package:recenth_posts/src/view/auth/sign_in_view/models/signin_response.dart';
import 'package:equatable/equatable.dart';

abstract class SignInBlocState extends Equatable {
  const SignInBlocState();

  @override
  List<Object> get props => [];
}

/// UnInitialized
class InitialSignInBlocState extends SignInBlocState {
  const InitialSignInBlocState();

  @override
  String toString() => 'Initial';
}

class LoadingSignInBlocState extends SignInBlocState {
  const LoadingSignInBlocState();

  @override
  String toString() => 'Loading';
}

/// Initialized
class SuccessfullSignInBlocState extends SignInBlocState {
  const SuccessfullSignInBlocState(this.response);

  final SigninResponse response;

  @override
  String toString() => 'InSignInBlocState ${response.toString()}';

  @override
  List<Object> get props => [response];
}

class ErrorSignInBlocState extends SignInBlocState {
  const ErrorSignInBlocState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'Error SignInBlocState $errorMessage';

  @override
  List<Object> get props => [errorMessage];
}
