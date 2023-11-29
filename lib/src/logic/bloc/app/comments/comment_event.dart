// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:developer' as developer;

import 'package:meta/meta.dart';
import 'package:recenth_posts/src/logic/models/app/post/res/comment_response.dart';
import 'package:recenth_posts/src/logic/models/app/post/res/get_all_post_response.dart';

import '../../../../utils/enums/enums.dart';
import '../../../models/app/post/payload/comment_payload.dart';
import '../../../models/service/un_auth_response.dart';
import '../../../repository/app/app_repo.dart';
import '../../../services/logger/logger.dart';
import 'comment_bloc.dart';
import 'comment_state.dart';

@immutable
abstract class CommentEvent {
  Stream<CommentState> applyAsync(
      {CommentState currentState, CommentBloc bloc});
}

class CommentOnPostEvent extends CommentEvent {
  final AppRepository appRepository;
  final CommentPayload commentPayload;
  CommentOnPostEvent(this.appRepository, this.commentPayload);
  @override
  Stream<CommentState> applyAsync(
      {CommentState? currentState, CommentBloc? bloc}) async* {
    try {
      yield const CommentLoadingState();
      var res = await appRepository.comment(commentPayload);
      if (res.$2 == ResponseType.Success) {
        var data = PostResponse.fromJson(res.$1!);
        yield CommentLoadedState(message: data.message!);
      } else {
        if (res.$1 == null) {
          Logger.log(tag: Tag.ERROR, message: 'UNKNOWN ERROR OCCURED');
          yield const CommentErrorState('UNKNOWN ERROR OCCURED');
        } else {
          Logger.log(tag: Tag.ERROR, message: res.toString());
          GeneralErrorResponse err = GeneralErrorResponse.fromJson(res.$1!);
          yield CommentErrorState(err.message!);
        }
      }
      yield const CommentInitialState();
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadCommentEvent', error: _, stackTrace: stackTrace);
      yield CommentErrorState(_.toString());
    }
  }
}

class GetPostsCommentEvent extends CommentEvent {
  final AppRepository appRepository;
  final int id;
  final String type;

  GetPostsCommentEvent(this.appRepository, this.id, this.type);
  @override
  Stream<CommentState> applyAsync(
      {CommentState? currentState, CommentBloc? bloc}) async* {
    try {
      yield const CommentLoadingState();
      var res = await appRepository.getComment(id: id, type: type);
      if (res.$2 == ResponseType.Success) {
        var data = CommentResponse.fromJson(res.$1!);
        yield GetCommentsLoadedState(comments: data.data!);
      } else {
        if (res.$1 == null) {
          Logger.log(tag: Tag.ERROR, message: 'UNKNOWN ERROR OCCURED');
          yield const CommentErrorState('UNKNOWN ERROR OCCURED');
        } else {
          Logger.log(tag: Tag.ERROR, message: res.toString());
          GeneralErrorResponse err = GeneralErrorResponse.fromJson(res.$1!);
          yield CommentErrorState(err.message!);
        }
      }
      yield const CommentInitialState();
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadCommentEvent', error: _, stackTrace: stackTrace);
      yield CommentErrorState(_.toString());
    }
  }
}
