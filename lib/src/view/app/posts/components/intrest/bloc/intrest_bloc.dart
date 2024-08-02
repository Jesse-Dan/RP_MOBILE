// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';

import '../../../../../../logic/services/logger/logger.dart';
import 'intrest_event.dart';
import 'intrest_state.dart';

class IntrestBloc extends Bloc<IntrestEvent, IntrestState> {
  IntrestBloc(IntrestState initialState) : super(initialState) {
    on<IntrestEvent>((event, emit) {
      return emit.forEach<IntrestState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          Logger.log(
              error: error,
              tag: Tag.BLOC_EVENT,
              stackTrace: stackTrace,
              message: '$error');
          return ErrorIntrestState(error.toString());
        },
      );
    });
  }
}
