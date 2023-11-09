import 'package:equatable/equatable.dart';

abstract class PostState extends Equatable {
  PostState();

  List<Object> get props => [];
}

/// UnInitialized
class LoadedPostState extends PostState {
  LoadedPostState();

  @override
  String toString() => 'UnPostState';
}

class InitialPostState extends PostState {
  InitialPostState();

  @override
  List<Object> get props => [];
}

class PostLoadingState extends PostState {
  PostLoadingState();

  @override
  List<Object> get props => [];
}

class PostErrorState extends PostState {
  PostErrorState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorPostState$errorMessage';

  @override
  List<Object> get props => [errorMessage];
}
