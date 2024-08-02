// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:developer' as developer;

import 'package:recenth_posts/src/logic/repository/app/app_repo.dart';
import 'package:meta/meta.dart';

import '../../../../../../logic/services/logger/logger.dart';
import '../../../../../../utils/enums/enums.dart';
import '../model/post_response_model.dart';
import 'index.dart';

@immutable
abstract class GetPostBlocEvent {
  Stream<GetPostBlocState> applyAsync(
      {GetPostBlocState currentState, GetPostBlocBloc bloc});
}

class UnGetPostBlocEvent extends GetPostBlocEvent {
  @override
  Stream<GetPostBlocState> applyAsync(
      {GetPostBlocState? currentState, GetPostBlocBloc? bloc}) async* {
    yield const GetPostInitialState();
  }
}

class LoadGetPostBlocEvent extends GetPostBlocEvent {
  @override
  Stream<GetPostBlocState> applyAsync(
      {GetPostBlocState? currentState, GetPostBlocBloc? bloc}) async* {
    try {
      var res = await AppRepository().getAllPosts();

      if (res.$1?['message'] == 'Post Fetched Successfully') {
        var response = PostResponse.fromJson(res.$1!);
        Logger.log(tag: Tag.DEBUG, message: response.message!);
        yield GetPostSucessfulState(response);
      } else {
        yield ErrorGetPostBlocState(res.$3);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadGetPostBlocEvent', error: _, stackTrace: stackTrace);
      Logger.log(
          tag: Tag.ERROR, message: '$_', error: _, stackTrace: stackTrace);
      yield ErrorGetPostBlocState(_.toString());
    }
  }
}
