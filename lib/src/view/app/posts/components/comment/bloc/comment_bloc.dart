// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';

import '../../../../../../logic/services/logger/logger.dart';
import 'comment_event.dart';
import 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc(CommentState initialState) : super(initialState) {
    on<CommentEvent>((event, emit) {
      return emit.forEach<CommentState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          Logger.log(
              error: error,
              tag: Tag.BLOC_EVENT,
              stackTrace: stackTrace,
              message: '$error');
          return ErrorCommentState(error.toString());
        },
      );
    });
  }
}
