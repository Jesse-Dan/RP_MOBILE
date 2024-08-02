// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:developer' as developer;

import 'package:recenth_posts/src/logic/models/app/generic_response.dart';
import 'package:recenth_posts/src/logic/repository/app/app_repo.dart';
import 'package:recenth_posts/src/logic/services/logger/logger.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:recenth_posts/src/view/app/posts/components/block_user/model/blocked_user_payload.dart';
import 'package:meta/meta.dart';
import 'block_user_bloc.dart';
import 'block_user_state.dart';

@immutable
abstract class BlockedEvent {
  Stream<BlockedState> applyAsync(
      {BlockedState currentState, BlockedBloc bloc});
}

class UnBlockedEvent extends BlockedEvent {
  @override
  Stream<BlockedState> applyAsync(
      {BlockedState? currentState, BlockedBloc? bloc}) async* {
    yield const InitialBlockedState();
  }
}

class Action extends BlockedEvent {
  final BlockedPayload blockPayLoad;

  Action(this.blockPayLoad);
  @override
  Stream<BlockedState> applyAsync(
      {BlockedState? currentState, BlockedBloc? bloc}) async* {
    try {
      yield const InitialBlockedState();
      Logger.log(
          tag: Tag.BLOC_EVENT, message: blockedUserPayloadToJson(blockPayLoad));
      var res = await AppRepository().block(blockPayLoad);
      if (res.$1?['statusCode'] == 200) {
        var resVal = GenericResponse.fromJson(res.$1!);
        Logger.log(tag: Tag.BLOC_EVENT, message: resVal.message);
        yield InBlockedState(resVal);
      } else {
        yield ErrorBlockedState(res.$3);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadBlockedEvent', error: _, stackTrace: stackTrace);
      yield ErrorBlockedState(_.toString());
    }
  }
}
