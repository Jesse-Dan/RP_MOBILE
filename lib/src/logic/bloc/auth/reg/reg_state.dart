import 'package:equatable/equatable.dart';
import 'package:recenth_posts/src/logic/models/auth/auth/reg/reg_response.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

class RegistrationLoadedState extends RegistrationState {
  final RegResponse regResponses;
  const RegistrationLoadedState({required this.regResponses});

  @override
  String toString() => 'UnRegistrationState';
  @override
  List<Object> get props => [regResponses];
}

class RegistrationInitialState extends RegistrationState {
  const RegistrationInitialState();

  @override
  List<Object> get props => [];
}

class RegistrationLoadingState extends RegistrationState {
  const RegistrationLoadingState();

  @override
  List<Object> get props => [];
}

class RegistrationErrorState extends RegistrationState {
  const RegistrationErrorState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorRegistrationState$errorMessage';

  @override
  List<Object> get props => [errorMessage];
}
