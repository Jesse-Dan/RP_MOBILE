import 'package:equatable/equatable.dart';
import 'package:recenth_posts/src/logic/models/app/post/res/get_all_post_response.dart';

abstract class PostState extends Equatable {
  PostState();

  List<Object> get props => [];
}

class PostLoadedState extends PostState {
  final List<PostResponse> postResponses;
  PostLoadedState({required this.postResponses});

  @override
  String toString() => 'UnPostState';
  List<Object> get props => [postResponses];
}

class PostInitialState extends PostState {
  PostInitialState();

  @override
  List<Object> get props => [];
}

class PostLoadingState extends PostState {
  PostLoadingState();

  @override
  List<Object> get props => [];
}

class PostErrorState extends PostState {
  PostErrorState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorPostState$errorMessage';

  @override
  List<Object> get props => [errorMessage];
}
