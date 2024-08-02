import 'package:recenth_posts/src/logic/models/app/generic_response.dart';
import 'package:equatable/equatable.dart';

abstract class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object> get props => [];
}

/// Initial State
class InitialCommentState extends CommentState {
  const InitialCommentState();

  @override
  String toString() => 'InitialCommentState';
}

/// Loading State
class LoadingCommentState extends CommentState {
  const LoadingCommentState();

  @override
  String toString() => 'LoadingCommentState';
}

/// Loaded
class InCommentState extends CommentState {
  const InCommentState(this.genericResponse);

  final GenericResponse genericResponse;

  @override
  String toString() => 'InCommentState $genericResponse';

  @override
  List<Object> get props => [genericResponse];
}

class ErrorCommentState extends CommentState {
  const ErrorCommentState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorCommentState';

  @override
  List<Object> get props => [errorMessage];
}
