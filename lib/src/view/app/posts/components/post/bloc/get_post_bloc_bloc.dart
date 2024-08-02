// ignore_for_file: depend_on_referenced_packages

import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';

import 'get_post_bloc_event.dart';
import 'get_post_bloc_state.dart';

class GetPostBlocBloc extends Bloc<GetPostBlocEvent, GetPostBlocState> {

  GetPostBlocBloc(GetPostBlocState initialState) : super(initialState){
   on<GetPostBlocEvent>((event, emit) {
      return emit.forEach<GetPostBlocState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error', name: 'GetPostBlocBloc', error: error, stackTrace: stackTrace);
          return ErrorGetPostBlocState(error.toString());
        },
      );
    });
  }
}
