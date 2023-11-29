import 'package:equatable/equatable.dart';
import 'package:recenth_posts/src/logic/models/app/post/res/comment_response.dart';
import 'package:recenth_posts/src/logic/models/app/post/res/get_all_post_response.dart';

import '../../../models/app/post/res/react_response.dart';
import '../../../models/app/post/res/view_response.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostLoadedState extends PostState {
  final List<Post> postResponse;
  const PostLoadedState({required this.postResponse});

  @override
  String toString() => 'UnPostState';
  @override
  List<Object> get props => [postResponse];
}

class ViewsLoadedState extends PostState {
  final List<View> views;
  const ViewsLoadedState({required this.views});

  @override
  String toString() => 'UnPostState';
  @override
  List<Object> get props => [views];
}

class CommentsLoadedState extends PostState {
  final List<Comment> comments;
  const CommentsLoadedState({required this.comments});

  @override
  String toString() => 'UnPostState';
  @override
  List<Object> get props => [comments];
}

class ReactionLoadedState extends PostState {
  final List<Reaction> reactions;
  const ReactionLoadedState({required this.reactions});

  @override
  String toString() => 'UnPostState';
  @override
  List<Object> get props => [reactions];
}

class PostInitialState extends PostState {
  const PostInitialState();

  @override
  List<Object> get props => [];
}

class PostLoadingState extends PostState {
  const PostLoadingState();

  @override
  List<Object> get props => [];
}

class PostErrorState extends PostState {
  const PostErrorState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorPostState$errorMessage';

  @override
  List<Object> get props => [errorMessage];
}
