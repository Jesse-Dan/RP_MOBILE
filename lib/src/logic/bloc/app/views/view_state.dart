import 'package:equatable/equatable.dart';

import '../../../models/app/post/res/view_response.dart';

abstract class ViewState extends Equatable {
  const ViewState();

  @override
  List<Object> get props => [];
}

class ViewLoadedState extends ViewState {
  final String message;
  const ViewLoadedState({required this.message});

  @override
  String toString() => 'UnViewState';
  @override
  List<Object> get props => [message];
}

class GetViewsLoadedState extends ViewState {
  final List<View> views;
  const GetViewsLoadedState({required this.views});

  @override
  String toString() => 'UnViewState';
  @override
  List<Object> get props => [views];
}

class ViewInitialState extends ViewState {
  const ViewInitialState();

  @override
  List<Object> get props => [];
}

class ViewLoadingState extends ViewState {
  const ViewLoadingState();

  @override
  List<Object> get props => [];
}

class ViewErrorState extends ViewState {
  const ViewErrorState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorViewState$errorMessage';

  @override
  List<Object> get props => [errorMessage];
}
