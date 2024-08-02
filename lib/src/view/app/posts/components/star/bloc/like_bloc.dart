// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';

import '../../../../../../logic/services/logger/logger.dart';
import 'like_event.dart';
import 'like_state.dart';

class LikeBloc extends Bloc<LikeEvent, LikeState> {
  LikeBloc(LikeState initialState) : super(initialState) {
    on<LikeEvent>((event, emit) {
      return emit.forEach<LikeState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          Logger.log(
              error: error,
              tag: Tag.BLOC_EVENT,
              stackTrace: stackTrace,
              message: '$error');
          return ErrorLikeState(error.toString());
        },
      );
    });
  }
}
