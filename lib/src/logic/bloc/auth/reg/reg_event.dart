import 'dart:async';
import 'dart:developer' as developer;

import 'package:meta/meta.dart';
import 'package:recenth_posts/src/logic/models/auth/auth/reg/reg_payload.dart';

import '../../../repository/auth/auth_repo.dart';
import 'reg_bloc.dart';
import 'reg_state.dart';

@immutable
abstract class RegistrationEvent {
  Stream<RegistrationState> applyAsync(
      {RegistrationState currentState, RegistrationBloc bloc});
}

class UserRegEvent extends RegistrationEvent {
  final AuthRepository authRepository;
  final RegPayload regPayload;
  UserRegEvent(this.authRepository, {required this.regPayload});
  @override
  Stream<RegistrationState> applyAsync(
      {RegistrationState? currentState, RegistrationBloc? bloc}) async* {
    try {
      yield RegistrationLoadingState();
      var res = await authRepository.register(regPayload: regPayload);
      yield RegistrationLoadedState(regResponses: res!);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadRegistrationEvent', error: _, stackTrace: stackTrace);
      yield RegistrationErrorState(_.toString());
    }
  }
}
