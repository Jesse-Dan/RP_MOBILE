import 'package:recenth_posts/src/logic/models/app/generic_response.dart';
import 'package:equatable/equatable.dart';

abstract class BlockedState extends Equatable {
  const BlockedState();

  @override
  List<Object> get props => [];
}

/// Initial State
class InitialBlockedState extends BlockedState {
  const InitialBlockedState();

  @override
  String toString() => 'InitialBlockedState';
}

/// Loading State
class LoadingBlockedState extends BlockedState {
  const LoadingBlockedState();

  @override
  String toString() => 'LoadingBlockedState';
}

/// Loaded
class InBlockedState extends BlockedState {
  const InBlockedState(this.genericResponse);

  final GenericResponse genericResponse;

  @override
  String toString() => 'InBlockedState $genericResponse';

  @override
  List<Object> get props => [genericResponse];
}

class ErrorBlockedState extends BlockedState {
  const ErrorBlockedState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorBlockedState';

  @override
  List<Object> get props => [errorMessage];
}
