import 'package:country_state_city/utils/utils.dart';

class LocationService {
  static getCountries() async {
    return await getAllCountries();
  }

  static getCountriesState(String countryCode) async {
    return await getStatesOfCountry(countryCode);
  }
}
