// ignore_for_file: depend_on_referenced_packages

import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'country_event.dart';
import 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  CountryBloc(CountryState initialState) : super(initialState) {
    on<CountryEvent>((event, emit) {
      return emit.forEach<CountryState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error',
              name: 'CountryBloc', error: error, stackTrace: stackTrace);
          return CountryErrorState(error.toString());
        },
      );
    });
  }
}
