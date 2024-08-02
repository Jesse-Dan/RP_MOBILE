import 'package:recenth_posts/src/logic/models/app/generic_response.dart';
import 'package:equatable/equatable.dart';

abstract class ReportState extends Equatable {
  const ReportState();

  @override
  List<Object> get props => [];
}

/// Initial State
class InitialReportState extends ReportState {
  const InitialReportState();

  @override
  String toString() => 'InitialReportState';
}

/// Loading State
class LoadingReportState extends ReportState {
  const LoadingReportState();

  @override
  String toString() => 'LoadingReportState';
}

/// Loaded
class InReportState extends ReportState {
  const InReportState(this.genericResponse);

  final GenericResponse genericResponse;

  @override
  String toString() => 'InReportState $genericResponse';

  @override
  List<Object> get props => [genericResponse];
}

class ErrorReportState extends ReportState {
  const ErrorReportState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorReportState';

  @override
  List<Object> get props => [errorMessage];
}
