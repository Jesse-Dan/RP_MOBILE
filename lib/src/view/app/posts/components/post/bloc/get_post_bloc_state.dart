import 'package:equatable/equatable.dart';

import '../model/post_response_model.dart';

abstract class GetPostBlocState extends Equatable {
  const GetPostBlocState();

  @override
  List<Object> get props => [];
}

/// Initialized
class GetPostInitialState extends GetPostBlocState {
  const GetPostInitialState();

  @override
  String toString() => 'UnGetPostBlocState';
}

/// Initialized
class GetPostLoadingState extends GetPostBlocState {
  const GetPostLoadingState();

  @override
  String toString() => 'UnGetPostBlocState';
}

/// Loaded
class GetPostSucessfulState extends GetPostBlocState {
  const GetPostSucessfulState(this.response);

  final PostResponse response;

  @override
  String toString() => 'InGetPostBlocState ${response.toString()}';

  @override
  List<Object> get props => [response];
}

class ErrorGetPostBlocState extends GetPostBlocState {
  const ErrorGetPostBlocState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorGetPostBlocState';

  @override
  List<Object> get props => [errorMessage];
}
