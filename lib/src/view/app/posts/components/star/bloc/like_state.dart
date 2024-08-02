import 'package:recenth_posts/src/logic/models/app/generic_response.dart';
import 'package:equatable/equatable.dart';

abstract class LikeState extends Equatable {
  const LikeState();

  @override
  List<Object> get props => [];
}

/// Initial State
class InitialLikeState extends LikeState {
  const InitialLikeState();

  @override
  String toString() => 'InitialLikeState';
}

/// Loading State
class LoadingLikeState extends LikeState {
  const LoadingLikeState();

  @override
  String toString() => 'LoadingLikeState';
}

/// Loaded
class InLikeState extends LikeState {
  const InLikeState(this.genericResponse);

  final GenericResponse genericResponse;

  @override
  String toString() => 'InLikeState $genericResponse';

  @override
  List<Object> get props => [genericResponse];
}

class ErrorLikeState extends LikeState {
  const ErrorLikeState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorLikeState';

  @override
  List<Object> get props => [errorMessage];
}
