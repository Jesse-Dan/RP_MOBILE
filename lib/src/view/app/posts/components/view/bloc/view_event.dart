// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:developer' as developer;

import 'package:recenth_posts/src/logic/models/app/generic_response.dart';
import 'package:recenth_posts/src/logic/repository/app/app_repo.dart';
import 'package:recenth_posts/src/logic/services/logger/logger.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:meta/meta.dart';

import '../model/view_payload.dart';
import 'view_bloc.dart';
import 'view_state.dart';

@immutable
abstract class ViewEvent {
  Stream<ViewState> applyAsync({ViewState currentState, ViewBloc bloc});
}

class UnViewEvent extends ViewEvent {
  @override
  Stream<ViewState> applyAsync(
      {ViewState? currentState, ViewBloc? bloc}) async* {
    yield const InitialViewState();
  }
}

class LoadViewEvent extends ViewEvent {
  final ViewPayload viewPayload;

  LoadViewEvent(this.viewPayload);
  @override
  Stream<ViewState> applyAsync(
      {ViewState? currentState, ViewBloc? bloc}) async* {
    try {
      yield const InitialViewState();
      Logger.log(tag: Tag.BLOC_EVENT, message: viewPayloadToJson(viewPayload));
      var res = await AppRepository().view(viewPayload);
      if (res.$1?['statusCode'] == 200) {
        var resVal = GenericResponse.fromJson(res.$1!);
        Logger.log(tag: Tag.BLOC_EVENT, message: resVal.message);
        yield InViewState(resVal);
      } else {
        yield ErrorViewState(res.$3);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadViewEvent', error: _, stackTrace: stackTrace);
      yield ErrorViewState(_.toString());
    }
  }
}
