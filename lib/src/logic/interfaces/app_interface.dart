import 'package:recenth_posts/src/logic/models/service/base_response.dart';

import '../../utils/enums/enums.dart';
import '../models/app/countries/countries_response.dart';

mixin AppInterface {
  Future<(Map<String, dynamic>?, ResponseType)> getAllPosts(
      {Map<String, dynamic>? queryParams});

  Future<(Map<String, dynamic>?, ResponseType)> comment();

  Future<(Map<String, dynamic>?, ResponseType)> react();

  Future<(Map<String, dynamic>?, ResponseType)> view();

  Future<(Map<String, dynamic>?, ResponseType)> getCountries();
}
