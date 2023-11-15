import 'package:equatable/equatable.dart';
import 'package:recenth_posts/src/logic/models/auth/auth/reg/reg_response.dart';

import '../../models/auth/auth/login/login_response.dart';


abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class LoginLoadedState extends AuthState {
  final LoginResponse postResponses;
  const LoginLoadedState({required this.postResponses});

  @override
  String toString() => 'UnLoginState';
  @override
  List<Object> get props => [postResponses];
}

class AuthInitialState extends AuthState {
  const AuthInitialState();

  @override
  List<Object> get props => [];
}

class AuthLoadingState extends AuthState {
  const AuthLoadingState();

  @override
  List<Object> get props => [];
}

class AuthErrorState extends AuthState {
  const AuthErrorState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorLoginState$errorMessage';

  @override
  List<Object> get props => [errorMessage];
}

class RegLoadedState extends AuthState {
  final RegResponse regResponse;
  const RegLoadedState({required this.regResponse});

  @override
  String toString() => 'UnLoginState';
  @override
  List<Object> get props => [regResponse];
}
