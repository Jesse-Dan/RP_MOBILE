import 'package:recenth_posts/src/logic/models/app/generic_response.dart';
import 'package:equatable/equatable.dart';

abstract class FavPostState extends Equatable {
  const FavPostState();

  @override
  List<Object> get props => [];
}

/// Initial State
class InitialFavPostState extends FavPostState {
  const InitialFavPostState();

  @override
  String toString() => 'InitialFavPostState';
}

/// Loading State
class LoadingFavPostState extends FavPostState {
  const LoadingFavPostState();

  @override
  String toString() => 'LoadingFavPostState';
}

/// Loaded
class InFavPostState extends FavPostState {
  const InFavPostState(this.genericResponse);

  final GenericResponse genericResponse;

  @override
  String toString() => 'InFavPostState $genericResponse';

  @override
  List<Object> get props => [genericResponse];
}

class ErrorFavPostState extends FavPostState {
  const ErrorFavPostState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorFavPostState';

  @override
  List<Object> get props => [errorMessage];
}
