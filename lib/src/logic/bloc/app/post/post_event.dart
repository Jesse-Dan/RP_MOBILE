// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:developer' as developer;

import 'package:meta/meta.dart';

import '../../../repository/app/app_repo.dart';
import 'index.dart';

@immutable
abstract class PostEvent {
  Stream<PostState> applyAsync({PostState currentState, PostBloc bloc});
}

class GetAllPostEvent extends PostEvent {
  final AppRepository postRepository;
  GetAllPostEvent(this.postRepository);
  @override
  Stream<PostState> applyAsync(
      {PostState? currentState, PostBloc? bloc}) async* {
    try {
      yield const PostLoadingState();
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadPostEvent', error: _, stackTrace: stackTrace);
      yield PostErrorState(_.toString());
    }
  }
}

class ReactToPostEvent extends PostEvent {
  final AppRepository postRepository;
  ReactToPostEvent(this.postRepository);
  @override
  Stream<PostState> applyAsync(
      {PostState? currentState, PostBloc? bloc}) async* {
    try {
      yield const PostLoadingState();
      await Future.delayed(const Duration(seconds: 1));
      yield const PostInitialState();
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadPostEvent', error: _, stackTrace: stackTrace);
      yield PostErrorState(_.toString());
    }
  }
}

class CommentOnPostEvent extends PostEvent {
  final AppRepository postRepository;
  CommentOnPostEvent(this.postRepository);
  @override
  Stream<PostState> applyAsync(
      {PostState? currentState, PostBloc? bloc}) async* {
    try {
      yield const PostLoadingState();
      await Future.delayed(const Duration(seconds: 1));
      yield const PostInitialState();
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadPostEvent', error: _, stackTrace: stackTrace);
      yield PostErrorState(_.toString());
    }
  }
}

class ViewPostEvent extends PostEvent {
  final AppRepository postRepository;
  ViewPostEvent(this.postRepository);
  @override
  Stream<PostState> applyAsync(
      {PostState? currentState, PostBloc? bloc}) async* {
    try {
      yield const PostLoadingState();
      await Future.delayed(const Duration(seconds: 1));
      yield const PostInitialState();
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadPostEvent', error: _, stackTrace: stackTrace);
      yield PostErrorState(_.toString());
    }
  }
}
