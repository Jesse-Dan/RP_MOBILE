import 'package:recenth_posts/src/logic/models/app/generic_response.dart';
import 'package:equatable/equatable.dart';

abstract class PollState extends Equatable {
  const PollState();

  @override
  List<Object> get props => [];
}

/// Initial State
class InitialPollState extends PollState {
  const InitialPollState();

  @override
  String toString() => 'InitialPollState';
}

/// Loading State
class LoadingPollState extends PollState {
  const LoadingPollState();

  @override
  String toString() => 'LoadingPollState';
}

/// Loaded
class InPollState extends PollState {
  const InPollState(this.genericResponse);

  final GenericResponse genericResponse;

  @override
  String toString() => 'InPollState $genericResponse';

  @override
  List<Object> get props => [genericResponse];
}

class ErrorPollState extends PollState {
  const ErrorPollState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorPollState';

  @override
  List<Object> get props => [errorMessage];
}
