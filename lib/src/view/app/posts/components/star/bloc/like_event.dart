// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:developer' as developer;

import 'package:recenth_posts/src/logic/models/app/generic_response.dart';
import 'package:recenth_posts/src/logic/repository/app/app_repo.dart';
import 'package:recenth_posts/src/logic/services/logger/logger.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:meta/meta.dart';

import '../model/star_payload.dart';
import 'like_bloc.dart';
import 'like_state.dart';

@immutable
abstract class LikeEvent {
  Stream<LikeState> applyAsync({LikeState currentState, LikeBloc bloc});
}

class UnLikeEvent extends LikeEvent {
  @override
  Stream<LikeState> applyAsync(
      {LikeState? currentState, LikeBloc? bloc}) async* {
    yield const InitialLikeState();
  }
}

class LoadLikeEvent extends LikeEvent {
  final StarPayload starPayload;

  LoadLikeEvent(this.starPayload);
  @override
  Stream<LikeState> applyAsync(
      {LikeState? currentState, LikeBloc? bloc}) async* {
    try {
      yield const InitialLikeState();
      Logger.log(tag: Tag.BLOC_EVENT, message: starPayloadToJson(starPayload));
      var res = await AppRepository().star(starPayload);
      if (res.$1?['statusCode'] == 200) {
        var resVal = GenericResponse.fromJson(res.$1!);
        Logger.log(tag: Tag.BLOC_EVENT, message: resVal.message);
        yield InLikeState(resVal);
      } else {
        yield ErrorLikeState(res.$3);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadLikeEvent', error: _, stackTrace: stackTrace);
      yield ErrorLikeState(_.toString());
    }
  }
}
