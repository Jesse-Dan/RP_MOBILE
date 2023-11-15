import 'package:equatable/equatable.dart';

import '../../../models/auth/auth/login/login_response.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginLoadedState extends LoginState {
  final LoginResponse postResponses;
  const LoginLoadedState({required this.postResponses});

  @override
  String toString() => 'UnLoginState';
  @override
  List<Object> get props => [postResponses];
}

class LoginInitialState extends LoginState {
  const LoginInitialState();

  @override
  List<Object> get props => [];
}

class LoginLoadingState extends LoginState {
  const LoginLoadingState();

  @override
  List<Object> get props => [];
}

class LoginErrorState extends LoginState {
  const LoginErrorState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorLoginState$errorMessage';

  @override
  List<Object> get props => [errorMessage];
}
