// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:developer' as developer;

import 'package:meta/meta.dart';
import 'package:recenth_posts/src/logic/models/app/post/res/react_response.dart';

import '../../../../utils/enums/enums.dart';
import '../../../models/app/post/payload/react_payload.dart';
import '../../../models/service/un_auth_response.dart';
import '../../../repository/app/app_repo.dart';
import '../../../services/logger/logger.dart';
import 'reaction_bloc.dart';
import 'reaction_state.dart';

@immutable
abstract class ReactionEvent {
  Stream<ReactionState> applyAsync(
      {ReactionState currentState, ReactionBloc bloc});
}

class ReactToPostsEvent extends ReactionEvent {
  final AppRepository appRepository;
  final ReactPayload reactPayload;
  ReactToPostsEvent(this.appRepository, this.reactPayload);
  @override
  Stream<ReactionState> applyAsync(
      {ReactionState? currentState, ReactionBloc? bloc}) async* {
    try {
      yield const ReactionLoadingState();
      var res = await appRepository.react(reactPayload);
      if (res.$2 == ResponseType.Success) {
        var data = GeneralErrorResponse.fromJson(res.$1!);
        yield ReactionLoadedState(message: data.message!);
      } else {
        if (res.$1 == null) {
          Logger.log(tag: Tag.ERROR, message: 'UNKNOWN ERROR OCCURED');
          yield const ReactionErrorState('UNKNOWN ERROR OCCURED');
        } else {
          Logger.log(tag: Tag.ERROR, message: res.toString());
          GeneralErrorResponse err = GeneralErrorResponse.fromJson(res.$1!);
          yield ReactionErrorState(err.message!);
        }
      }
      yield const ReactionInitialState();
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadReactionEvent', error: _, stackTrace: stackTrace);
      yield ReactionErrorState(_.toString());
    }
  }
}

class GetPostsReactionEvent extends ReactionEvent {
  final AppRepository appRepository;
  final int id;
  final String type;

  GetPostsReactionEvent(this.appRepository, this.id, this.type);
  @override
  Stream<ReactionState> applyAsync(
      {ReactionState? currentState, ReactionBloc? bloc}) async* {
    try {
      yield const ReactionLoadingState();
      var res = await appRepository.getReaction(id: id, type: type);
      if (res.$2 == ResponseType.Success) {
        var data = ReactionResponse.fromJson(res.$1!);
        yield GetReactionLoadedState(reactions: data.data!);
      } else {
        if (res.$1 == null) {
          Logger.log(tag: Tag.ERROR, message: 'UNKNOWN ERROR OCCURED');
          yield const ReactionErrorState('UNKNOWN ERROR OCCURED');
        } else {
          Logger.log(tag: Tag.ERROR, message: res.toString());
          GeneralErrorResponse err = GeneralErrorResponse.fromJson(res.$1!);
          yield ReactionErrorState(err.message!);
        }
      }
      yield const ReactionInitialState();
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadReactionEvent', error: _, stackTrace: stackTrace);
      yield ReactionErrorState(_.toString());
    }
  }
}
