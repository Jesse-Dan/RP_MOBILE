// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:recenth_posts/src/logic/services/logger/logger.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'poll_event.dart';
import 'poll_state.dart';

class PollBloc extends Bloc<PollEvent, PollState> {
  PollBloc(PollState initialState) : super(initialState) {
    on<PollEvent>((event, emit) {
      return emit.forEach<PollState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          Logger.log(
              error: error,
              tag: Tag.BLOC_EVENT,
              stackTrace: stackTrace,
              message: '$error');
          return ErrorPollState(error.toString());
        },
      );
    });
  }
}
