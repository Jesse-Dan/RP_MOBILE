// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';

import '../../../../../../logic/services/logger/logger.dart';
import 'fav_post_event.dart';
import 'fav_post_state.dart';

class FavPostBloc extends Bloc<FavPostEvent, FavPostState> {
  FavPostBloc(FavPostState initialState) : super(initialState) {
    on<FavPostEvent>((event, emit) {
      return emit.forEach<FavPostState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          Logger.log(
              error: error,
              tag: Tag.BLOC_EVENT,
              stackTrace: stackTrace,
              message: '$error');
          return ErrorFavPostState(error.toString());
        },
      );
    });
  }
}
