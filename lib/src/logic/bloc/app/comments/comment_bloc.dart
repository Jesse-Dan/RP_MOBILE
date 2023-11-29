// ignore_for_file: depend_on_referenced_packages

import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';

import 'comment_event.dart';
import 'comment_state.dart';


class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc(CommentState initialState) : super(initialState) {
    on<CommentEvent>((event, emit) {
      return emit.forEach<CommentState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error',
              name: 'CommentBloc', error: error, stackTrace: stackTrace);
          return CommentErrorState(error.toString());
        },
      );
    });
  }
}
