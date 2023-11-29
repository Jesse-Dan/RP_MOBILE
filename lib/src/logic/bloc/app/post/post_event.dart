// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:developer' as developer;

import 'package:meta/meta.dart';
import 'package:recenth_posts/src/logic/models/app/post/res/get_all_post_response.dart';

import '../../../../utils/enums/enums.dart';
import '../../../models/service/un_auth_response.dart';
import '../../../repository/app/app_repo.dart';
import '../../../services/logger/logger.dart';
import 'index.dart';

@immutable
abstract class PostEvent {
  Stream<PostState> applyAsync({PostState currentState, PostBloc bloc});
}

class GetAllPostEvent extends PostEvent {
  final AppRepository appRepository;
  GetAllPostEvent(this.appRepository);
  @override
  Stream<PostState> applyAsync(
      {PostState? currentState, PostBloc? bloc}) async* {
    try {
      yield const PostLoadingState();
      var res = await appRepository.getAllPosts();
      if (res.$2 == ResponseType.Success) {
        var data = PostResponse.fromJson(res.$1!);
        yield PostLoadedState(postResponse: data.data!);
      } else {
        if (res.$1 == null) {
          Logger.log(tag: Tag.ERROR, message: 'UNKNOWN ERROR OCCURED');
          yield const PostErrorState('UNKNOWN ERROR OCCURED');
        } else {
          Logger.log(tag: Tag.ERROR, message: res.toString());
          GeneralErrorResponse err = GeneralErrorResponse.fromJson(res.$1!);
          yield PostErrorState(err.message!);
        }
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadPostEvent', error: _, stackTrace: stackTrace);
      yield PostErrorState(_.toString());
    }
  }
}