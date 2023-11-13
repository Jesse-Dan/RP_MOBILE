import 'package:equatable/equatable.dart';
import 'package:recenth_posts/src/logic/models/app/post/res/get_all_post_response.dart';

import '../../../models/auth/auth/login/login_response.dart';

abstract class LoginState extends Equatable {
  LoginState();

  List<Object> get props => [];
}

class LoginLoadedState extends LoginState {
  final LoginResponse postResponses;
  LoginLoadedState({required this.postResponses});

  @override
  String toString() => 'UnLoginState';
  List<Object> get props => [postResponses];
}

class LoginInitialState extends LoginState {
  LoginInitialState();

  @override
  List<Object> get props => [];
}

class LoginLoadingState extends LoginState {
  LoginLoadingState();

  @override
  List<Object> get props => [];
}

class LoginErrorState extends LoginState {
  LoginErrorState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorLoginState$errorMessage';

  @override
  List<Object> get props => [errorMessage];
}
