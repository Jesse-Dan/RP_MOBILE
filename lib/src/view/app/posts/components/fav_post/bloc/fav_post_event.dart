// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:developer' as developer;

import 'package:recenth_posts/src/logic/models/app/generic_response.dart';
import 'package:recenth_posts/src/logic/repository/app/app_repo.dart';
import 'package:recenth_posts/src/logic/services/logger/logger.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:meta/meta.dart';
import '../model/fav_post.dart';
import 'fav_post_bloc.dart';
import 'fav_post_state.dart';

@immutable
abstract class FavPostEvent {
  Stream<FavPostState> applyAsync(
      {FavPostState currentState, FavPostBloc bloc});
}

class UnFavPostEvent extends FavPostEvent {
  @override
  Stream<FavPostState> applyAsync(
      {FavPostState? currentState, FavPostBloc? bloc}) async* {
    yield const InitialFavPostState();
  }
}

class FavPostAction extends FavPostEvent {
  final FavPostPayload favPostPayload;

  FavPostAction(this.favPostPayload);
  @override
  Stream<FavPostState> applyAsync(
      {FavPostState? currentState, FavPostBloc? bloc}) async* {
    try {
      yield const InitialFavPostState();
      Logger.log(
          tag: Tag.BLOC_EVENT, message: favPostPayloadToJson(favPostPayload));
      var res = await AppRepository().favPost(favPostPayload);
      if (res.$1?['statusCode'] == 201) {
        var resVal = GenericResponse.fromJson(res.$1!);
        Logger.log(tag: Tag.BLOC_EVENT, message: resVal.message);
        yield InFavPostState(resVal);
      } else {
        yield ErrorFavPostState(res.$3);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadFavPostEvent', error: _, stackTrace: stackTrace);
      yield ErrorFavPostState(_.toString());
    }
  }
}
