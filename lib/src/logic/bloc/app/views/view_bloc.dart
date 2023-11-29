// ignore_for_file: depend_on_referenced_packages

import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';

import 'view_event.dart';
import 'view_state.dart';


class ViewBloc extends Bloc<ViewEvent, ViewState> {
  ViewBloc(ViewState initialState) : super(initialState) {
    on<ViewEvent>((event, emit) {
      return emit.forEach<ViewState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error',
              name: 'ViewBloc', error: error, stackTrace: stackTrace);
          return ViewErrorState(error.toString());
        },
      );
    });
  }
}
