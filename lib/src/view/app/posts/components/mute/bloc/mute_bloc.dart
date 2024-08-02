// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';

import '../../../../../../logic/services/logger/logger.dart';
import 'mute_event.dart';
import 'mute_state.dart';

class MuteBloc extends Bloc<MuteEvent, MuteState> {
  MuteBloc(MuteState initialState) : super(initialState) {
    on<MuteEvent>((event, emit) {
      return emit.forEach<MuteState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          Logger.log(
              error: error,
              tag: Tag.BLOC_EVENT,
              stackTrace: stackTrace,
              message: '$error');
          return ErrorMuteState(error.toString());
        },
      );
    });
  }
}
