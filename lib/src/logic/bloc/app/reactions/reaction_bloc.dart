// ignore_for_file: depend_on_referenced_packages

import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';

import 'reaction_event.dart';
import 'reaction_state.dart';

class ReactionBloc extends Bloc<ReactionEvent, ReactionState> {
  ReactionBloc(ReactionState initialState) : super(initialState) {
    on<ReactionEvent>((event, emit) {
      return emit.forEach<ReactionState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error',
              name: 'ReactionBloc', error: error, stackTrace: stackTrace);
          return ReactionErrorState(error.toString());
        },
      );
    });
  }
}
