import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:recenth_posts/src/logic/bloc/auth/reg/reg_event.dart';
import 'package:recenth_posts/src/logic/bloc/auth/reg/reg_state.dart';

import 'index.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc(RegistrationState initialState) : super(initialState) {
    on<RegistrationEvent>((event, emit) {
      return emit.forEach<RegistrationState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error',
              name: 'PostBloc', error: error, stackTrace: stackTrace);
          return RegistrationErrorState(error.toString());
        },
      );
    });
  }
}
