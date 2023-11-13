import 'dart:async';
import 'dart:developer' as developer;

import 'package:meta/meta.dart';
import 'package:recenth_posts/src/logic/models/auth/auth/login/login_payload.dart';

import '../../../repository/auth/auth_repo.dart';
import 'login_bloc.dart';
import 'login_state.dart';

@immutable
abstract class LoginEvent {
  Stream<LoginState> applyAsync({LoginState currentState, LoginBloc bloc});
}

class UserLoginEvent extends LoginEvent {
  final AuthRepository postRepository;
  final LoginPayload loginPayload;
  UserLoginEvent(this.postRepository, {required this.loginPayload});
  @override
  Stream<LoginState> applyAsync(
      {LoginState? currentState, LoginBloc? bloc}) async* {
    try {
      yield LoginLoadingState();
      var res = await postRepository.login(loginPayload: loginPayload);
      yield LoginLoadedState(postResponses: res!);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadLoginEvent', error: _, stackTrace: stackTrace);
      yield LoginErrorState(_.toString());
    }
  }
}
