import 'package:equatable/equatable.dart';
import 'package:recenth_posts/src/logic/models/app/post/res/comment_response.dart';


abstract class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object> get props => [];
}

class CommentLoadedState extends CommentState {
  final String message;
  const CommentLoadedState({required this.message});

  @override
  String toString() => 'UnCommentState';
  @override
  List<Object> get props => [message];
}

class GetCommentsLoadedState extends CommentState {
  final List<Comment> comments;
  const GetCommentsLoadedState({required this.comments});

  @override
  String toString() => 'UnCommentState';
  @override
  List<Object> get props => [comments];
}


class CommentInitialState extends CommentState {
  const CommentInitialState();

  @override
  List<Object> get props => [];
}

class CommentLoadingState extends CommentState {
  const CommentLoadingState();

  @override
  List<Object> get props => [];
}

class CommentErrorState extends CommentState {
  const CommentErrorState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorCommentState$errorMessage';

  @override
  List<Object> get props => [errorMessage];
}
