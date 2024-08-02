import 'package:recenth_posts/src/logic/models/app/generic_response.dart';
import 'package:equatable/equatable.dart';

abstract class ViewState extends Equatable {
  const ViewState();

  @override
  List<Object> get props => [];
}

/// Initial State
class InitialViewState extends ViewState {
  const InitialViewState();

  @override
  String toString() => 'InitialViewState';
}

/// Loading State
class LoadingViewState extends ViewState {
  const LoadingViewState();

  @override
  String toString() => 'LoadingViewState';
}

/// Loaded
class InViewState extends ViewState {
  const InViewState(this.genericResponse);

  final GenericResponse genericResponse;

  @override
  String toString() => 'InViewState $genericResponse';

  @override
  List<Object> get props => [genericResponse];
}

class ErrorViewState extends ViewState {
  const ErrorViewState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorViewState';

  @override
  List<Object> get props => [errorMessage];
}
