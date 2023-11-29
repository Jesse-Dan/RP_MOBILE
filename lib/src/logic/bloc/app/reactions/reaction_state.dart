import 'package:equatable/equatable.dart';

import '../../../models/app/post/res/react_response.dart';

abstract class ReactionState extends Equatable {
  const ReactionState();

  @override
  List<Object> get props => [];
}

class ReactionLoadedState extends ReactionState {
  final String message;
  const ReactionLoadedState({required this.message});

  @override
  String toString() => 'UnReactionState';
  @override
  List<Object> get props => [message];
}

class GetReactionLoadedState extends ReactionState {
  final List<Reaction> reactions;
  const GetReactionLoadedState({required this.reactions});

  @override
  String toString() => 'UnReactionState';
  @override
  List<Object> get props => [reactions];
}

class ReactionInitialState extends ReactionState {
  const ReactionInitialState();

  @override
  List<Object> get props => [];
}

class ReactionLoadingState extends ReactionState {
  const ReactionLoadingState();

  @override
  List<Object> get props => [];
}

class ReactionErrorState extends ReactionState {
  const ReactionErrorState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorReactionState$errorMessage';

  @override
  List<Object> get props => [errorMessage];
}
