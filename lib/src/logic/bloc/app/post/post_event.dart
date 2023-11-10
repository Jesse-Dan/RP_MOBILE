import 'dart:async';
import 'dart:developer' as developer;

import 'package:meta/meta.dart';
import 'package:recenth_posts/src/logic/repository/app/post_repo.dart';

import 'index.dart';

@immutable
abstract class PostEvent {
  Stream<PostState> applyAsync({PostState currentState, PostBloc bloc});
}

class GetAllPostEvent extends PostEvent {
  final PostRepository postRepository;
  GetAllPostEvent(this.postRepository);
  @override
  Stream<PostState> applyAsync(
      {PostState? currentState, PostBloc? bloc}) async* {
    try {
      yield PostLoadingState();
      var res = await postRepository.getAllPosts();
      yield PostLoadedState(postResponses: res.data!);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadPostEvent', error: _, stackTrace: stackTrace);
      yield PostErrorState(_.toString());
    }
  }
}

class ReactToPostEvent extends PostEvent {
  final PostRepository postRepository;
  ReactToPostEvent(this.postRepository);
  @override
  Stream<PostState> applyAsync(
      {PostState? currentState, PostBloc? bloc}) async* {
    try {
      yield PostLoadingState();
      await Future.delayed(const Duration(seconds: 1));
      yield PostInitialState();
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadPostEvent', error: _, stackTrace: stackTrace);
      yield PostErrorState(_.toString());
    }
  }
}

class CommentOnPostEvent extends PostEvent {
  final PostRepository postRepository;
  CommentOnPostEvent(this.postRepository);
  @override
  Stream<PostState> applyAsync(
      {PostState? currentState, PostBloc? bloc}) async* {
    try {
      yield PostLoadingState();
      await Future.delayed(const Duration(seconds: 1));
      yield PostInitialState();
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadPostEvent', error: _, stackTrace: stackTrace);
      yield PostErrorState(_.toString());
    }
  }
}

class ViewPostEvent extends PostEvent {
  final PostRepository postRepository;
  ViewPostEvent(this.postRepository);
  @override
  Stream<PostState> applyAsync(
      {PostState? currentState, PostBloc? bloc}) async* {
    try {
      yield PostLoadingState();
      await Future.delayed(const Duration(seconds: 1));
      yield PostInitialState();
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadPostEvent', error: _, stackTrace: stackTrace);
      yield PostErrorState(_.toString());
    }
  }
}
