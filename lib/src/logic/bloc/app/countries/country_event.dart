// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:developer' as developer;

import 'package:meta/meta.dart';

import '../../../../utils/enums/enums.dart';
import '../../../models/app/countries/countries_response.dart';
import '../../../models/service/un_auth_response.dart';
import '../../../repository/app/app_repo.dart';
import '../../../services/logger/logger.dart';
import 'country_bloc.dart';
import 'country_state.dart';

@immutable
abstract class CountryEvent {
  Stream<CountryState> applyAsync(
      {CountryState currentState, CountryBloc bloc});
}

class GetAllCountryEvent extends CountryEvent {
  final AppRepository appRepository;
  GetAllCountryEvent(this.appRepository);
  @override
  Stream<CountryState> applyAsync(
      {CountryState? currentState, CountryBloc? bloc}) async* {
    try {
      yield const CountryLoadingState();
      var res = await appRepository.getCountries();
      if (res.$2 == ResponseType.Success) {
        var data = CountriesResponse.fromJson(res.$1!);
        yield CountryLoadedState(countryResponses: data);
      } else {
        if (res.$1 == null) {
          Logger.log(tag: Tag.ERROR, message: 'UNKNOWN ERROR OCCURED');
          yield const CountryErrorState('UNKNOWN ERROR OCCURED');
        } else {
          Logger.log(tag: Tag.ERROR, message: res.toString());
          GeneralErrorResponse err = GeneralErrorResponse.fromJson(res.$1!);
          yield CountryErrorState(err.message!);
        }
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadCountryEvent', error: _, stackTrace: stackTrace);
      yield CountryErrorState(_.toString());
    }
  }
}
