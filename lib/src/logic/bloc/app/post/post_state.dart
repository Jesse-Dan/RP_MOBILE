import 'package:equatable/equatable.dart';
import 'package:recenth_posts/src/logic/models/app/post/res/get_all_post_response.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostLoadedState extends PostState {
  final List<PostResponse> postResponses;
  const PostLoadedState({required this.postResponses});

  @override
  String toString() => 'UnPostState';
  @override
  List<Object> get props => [postResponses];
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
