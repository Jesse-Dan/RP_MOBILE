// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:developer' as developer;

import 'package:recenth_posts/src/logic/models/app/generic_response.dart';
import 'package:recenth_posts/src/logic/repository/app/app_repo.dart';
import 'package:recenth_posts/src/logic/services/logger/logger.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:meta/meta.dart';
import '../model/mute_payload.dart';
import 'mute_bloc.dart';
import 'mute_state.dart';

@immutable
abstract class MuteEvent {
  Stream<MuteState> applyAsync({MuteState currentState, MuteBloc bloc});
}

class UnMuteEvent extends MuteEvent {
  @override
  Stream<MuteState> applyAsync(
      {MuteState? currentState, MuteBloc? bloc}) async* {
    yield const InitialMuteState();
  }
}

class Action extends MuteEvent {
  final MutePayload mutePayload;

  Action(this.mutePayload);
  @override
  Stream<MuteState> applyAsync(
      {MuteState? currentState, MuteBloc? bloc}) async* {
    try {
      yield const InitialMuteState();
      Logger.log(tag: Tag.BLOC_EVENT, message: mutePayloadToJson(mutePayload));
      var res = await AppRepository().mute(mutePayload);
      if (res.$1?['statusCode'] == 200) {
        var resVal = GenericResponse.fromJson(res.$1!);
        Logger.log(tag: Tag.BLOC_EVENT, message: resVal.message);
        yield InMuteState(resVal);
      } else {
        yield ErrorMuteState(res.$3);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadMuteEvent', error: _, stackTrace: stackTrace);
      yield ErrorMuteState(_.toString());
    }
  }
}
