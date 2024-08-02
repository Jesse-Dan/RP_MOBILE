import 'package:recenth_posts/src/logic/models/app/generic_response.dart';
import 'package:equatable/equatable.dart';

abstract class IntrestState extends Equatable {
  const IntrestState();

  @override
  List<Object> get props => [];
}

/// Initial State
class InitialIntrestState extends IntrestState {
  const InitialIntrestState();

  @override
  String toString() => 'InitialIntrestState';
}

/// Loading State
class LoadingIntrestState extends IntrestState {
  const LoadingIntrestState();

  @override
  String toString() => 'LoadingIntrestState';
}

/// Loaded
class InIntrestState extends IntrestState {
  const InIntrestState(this.genericResponse);

  final GenericResponse genericResponse;

  @override
  String toString() => 'InIntrestState $genericResponse';

  @override
  List<Object> get props => [genericResponse];
}

class ErrorIntrestState extends IntrestState {
  const ErrorIntrestState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorIntrestState';

  @override
  List<Object> get props => [errorMessage];
}
