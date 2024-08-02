// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';

import '../../../../../../logic/services/logger/logger.dart';
import 'block_user_event.dart';
import 'block_user_state.dart';

class BlockedBloc extends Bloc<BlockedEvent, BlockedState> {
  BlockedBloc(BlockedState initialState) : super(initialState) {
    on<BlockedEvent>((event, emit) {
      return emit.forEach<BlockedState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          Logger.log(
              error: error,
              tag: Tag.BLOC_EVENT,
              stackTrace: stackTrace,
              message: '$error');
          return ErrorBlockedState(error.toString());
        },
      );
    });
  }
}
