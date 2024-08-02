// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';

import '../../../../../../logic/services/logger/logger.dart';
import 'view_event.dart';
import 'view_state.dart';

class ViewBloc extends Bloc<ViewEvent, ViewState> {
  ViewBloc(ViewState initialState) : super(initialState) {
    on<ViewEvent>((event, emit) {
      return emit.forEach<ViewState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          Logger.log(
              error: error,
              tag: Tag.BLOC_EVENT,
              stackTrace: stackTrace,
              message: '$error');
          return ErrorViewState(error.toString());
        },
      );
    });
  }
}
