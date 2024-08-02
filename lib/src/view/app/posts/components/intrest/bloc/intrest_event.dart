// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:developer' as developer;

import 'package:recenth_posts/src/logic/models/app/generic_response.dart';
import 'package:recenth_posts/src/logic/repository/app/app_repo.dart';
import 'package:recenth_posts/src/logic/services/logger/logger.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:meta/meta.dart';

import '../model/intrest.dart';
import 'intrest_bloc.dart';
import 'intrest_state.dart';

@immutable
abstract class IntrestEvent {
  Stream<IntrestState> applyAsync(
      {IntrestState currentState, IntrestBloc bloc});
}

class UnIntrestEvent extends IntrestEvent {
  @override
  Stream<IntrestState> applyAsync(
      {IntrestState? currentState, IntrestBloc? bloc}) async* {
    yield const InitialIntrestState();
  }
}

class Action extends IntrestEvent {
  final IntrestPayload intrestPayload;

  Action(this.intrestPayload);
  @override
  Stream<IntrestState> applyAsync(
      {IntrestState? currentState, IntrestBloc? bloc}) async* {
    try {
      yield const InitialIntrestState();
      Logger.log(
          tag: Tag.BLOC_EVENT, message: intrestPayloadToJson(intrestPayload));
      var res = await AppRepository().intrest(intrestPayload);
      if (res.$1?['statusCode'] == 200) {
        var resVal = GenericResponse.fromJson(res.$1!);
        Logger.log(tag: Tag.BLOC_EVENT, message: resVal.message);
        yield InIntrestState(resVal);
      } else {
        yield ErrorIntrestState(res.$3);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadIntrestEvent', error: _, stackTrace: stackTrace);
      yield ErrorIntrestState(_.toString());
    }
  }
}
