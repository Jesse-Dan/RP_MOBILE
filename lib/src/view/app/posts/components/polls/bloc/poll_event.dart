// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:developer' as developer;

import 'package:recenth_posts/src/logic/models/app/generic_response.dart';
import 'package:recenth_posts/src/logic/repository/app/app_repo.dart';
import 'package:recenth_posts/src/logic/services/logger/logger.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:meta/meta.dart';

import '../models/poll_vote_payload.dart';
import 'poll_bloc.dart';
import 'poll_state.dart';

@immutable
abstract class PollEvent {
  Stream<PollState> applyAsync({PollState currentState, PollBloc bloc});
}

class UnPollEvent extends PollEvent {
  @override
  Stream<PollState> applyAsync(
      {PollState? currentState, PollBloc? bloc}) async* {
    yield const InitialPollState();
  }
}

class LoadPollEvent extends PollEvent {
  final PollVotePayload payload;
  LoadPollEvent(this.payload);
  @override
  Stream<PollState> applyAsync(
      {PollState? currentState, PollBloc? bloc}) async* {
    try {
      yield const InitialPollState();
      Logger.log(tag: Tag.BLOC_EVENT, message: pollVotePayloadToJson(payload));
      var res = await AppRepository().vote(payload);
      if (res.$1?['statusCode'] == 200) {
        var resVal = GenericResponse.fromJson(res.$1!);
        Logger.log(tag: Tag.BLOC_EVENT, message: resVal.message);
        yield InPollState(resVal);
      } else {
        yield ErrorPollState(res.$3);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadPollEvent', error: _, stackTrace: stackTrace);
      yield ErrorPollState(_.toString());
    }
  }
}
