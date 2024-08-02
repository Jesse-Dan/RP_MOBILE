import 'dart:async';
import 'dart:developer' as developer;

import 'package:recenth_posts/src/logic/models/app/generic_response.dart';
import 'package:recenth_posts/src/logic/repository/app/app_repo.dart';
import 'package:recenth_posts/src/logic/services/logger/logger.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:flutter/material.dart';
import '../model/comment_payload.dart';
import 'comment_bloc.dart';
import 'comment_state.dart';

@immutable
abstract class CommentEvent {
  Stream<CommentState> applyAsync(
      {CommentState currentState, CommentBloc bloc});
}

class UnCommentEvent extends CommentEvent {
  @override
  Stream<CommentState> applyAsync(
      {CommentState? currentState, CommentBloc? bloc}) async* {
    yield const InitialCommentState();
  }
}

class LoadCommentEvent extends CommentEvent {
  final CommentPayload commentPayload;

  LoadCommentEvent(this.commentPayload);
  @override
  Stream<CommentState> applyAsync(
      {CommentState? currentState, CommentBloc? bloc}) async* {
    try {
      yield const InitialCommentState();
      Logger.log(
          tag: Tag.BLOC_EVENT, message: commentPayloadToJson(commentPayload));
      var res = await AppRepository().comment(commentPayload);
      if (res.$1?['statusCode'] == 200) {
        var resVal = GenericResponse.fromJson(res.$1!);
        Logger.log(tag: Tag.BLOC_EVENT, message: resVal.message);
        yield InCommentState(resVal);
      } else {
        yield ErrorCommentState(res.$3);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadCommentEvent', error: _, stackTrace: stackTrace);
      yield ErrorCommentState(_.toString());
    }
  }
}

class GetCommentEvent extends CommentEvent {
  /// IN THE PARAMS [params] the ([this is the ref_id], [this is the ref_name])
  final (String, String) params;

  GetCommentEvent(this.params);
  @override
  Stream<CommentState> applyAsync(
      {CommentState? currentState, CommentBloc? bloc}) async* {
    try {
      yield const InitialCommentState();
      var res = await AppRepository().getCommentById(params);
      if (res.$1?['statusCode'] == 200) {
        var resVal = GenericResponse.fromJson(res.$1!);
        Logger.log(tag: Tag.BLOC_EVENT, message: resVal.message);
        yield InCommentState(resVal);
      } else {
        yield ErrorCommentState(res.$3);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadCommentEvent', error: _, stackTrace: stackTrace);
      yield ErrorCommentState(_.toString());
    }
  }
}
