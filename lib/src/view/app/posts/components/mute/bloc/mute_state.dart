import 'package:recenth_posts/src/logic/models/app/generic_response.dart';
import 'package:equatable/equatable.dart';

abstract class MuteState extends Equatable {
  const MuteState();

  @override
  List<Object> get props => [];
}

/// Initial State
class InitialMuteState extends MuteState {
  const InitialMuteState();

  @override
  String toString() => 'InitialMuteState';
}

/// Loading State
class LoadingMuteState extends MuteState {
  const LoadingMuteState();

  @override
  String toString() => 'LoadingMuteState';
}

/// Loaded
class InMuteState extends MuteState {
  const InMuteState(this.genericResponse);

  final GenericResponse genericResponse;

  @override
  String toString() => 'InMuteState $genericResponse';

  @override
  List<Object> get props => [genericResponse];
}

class ErrorMuteState extends MuteState {
  const ErrorMuteState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorMuteState';

  @override
  List<Object> get props => [errorMessage];
}
