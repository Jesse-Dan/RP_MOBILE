// ignore_for_file: depend_on_referenced_packages

import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';

import 'index.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc(PostState initialState) : super(initialState) {
    on<PostEvent>((event, emit) {
      return emit.forEach<PostState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error',
              name: 'PostBloc', error: error, stackTrace: stackTrace);
          return PostErrorState(error.toString());
        },
      );
    });
  }
}
