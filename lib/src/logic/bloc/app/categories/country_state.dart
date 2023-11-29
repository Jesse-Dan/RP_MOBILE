import 'package:equatable/equatable.dart';

import '../../../models/app/countries/countries_response.dart';

abstract class CountryState extends Equatable {
  const CountryState();

  @override
  List<Object> get props => [];
}

class CountryLoadedState extends CountryState {
  final CountriesResponse countryResponses;
  const CountryLoadedState({required this.countryResponses});

  @override
  String toString() => 'UnCountryState';
  @override
  List<Object> get props => [countryResponses];
}

class CountryInitialState extends CountryState {
  const CountryInitialState();

  @override
  List<Object> get props => [];
}

class CountryLoadingState extends CountryState {
  const CountryLoadingState();

  @override
  List<Object> get props => [];
}

class CountryErrorState extends CountryState {
  const CountryErrorState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorCountryState$errorMessage';

  @override
  List<Object> get props => [errorMessage];
}
