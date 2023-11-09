import 'dart:async';
import 'dart:developer' as developer;

import 'package:meta/meta.dart';

import 'index.dart';

@immutable
abstract class PostEvent {
  Stream<PostState> applyAsync({PostState currentState, PostBloc bloc});
}

class UnPostEvent extends PostEvent {
  @override
  Stream<PostState> applyAsync(
      {PostState? currentState, PostBloc? bloc}) async* {
    yield LoadedPostState();
  }
}

class LoadPostEvent extends PostEvent {
  @override
  Stream<PostState> applyAsync(
      {PostState? currentState, PostBloc? bloc}) async* {
    try {
      yield LoadedPostState();
      await Future.delayed(const Duration(seconds: 1));
      yield InitialPostState();
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadPostEvent', error: _, stackTrace: stackTrace);
      yield PostErrorState(_.toString());
    }
  }
}
