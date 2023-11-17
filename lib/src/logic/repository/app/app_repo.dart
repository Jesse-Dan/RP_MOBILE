import 'package:recenth_posts/src/logic/interfaces/app_interface.dart';

import '../../../utils/enums/enums.dart';
import '../../core/client.dart';

class AppRepository implements AppInterface {
  ApiClient appClient = ApiClient();

  @override
  Future<(Map<String, dynamic>?, ResponseType)> getAllPosts(
      {Map<String, dynamic>? queryParams}) async {
    // TODO: implement comment
    throw UnimplementedError();
  }

  @override
  Future<(Map<String, dynamic>?, ResponseType)> comment() {
    // TODO: implement comment
    throw UnimplementedError();
  }

  @override
  Future<(Map<String, dynamic>?, ResponseType)> react() {
    // TODO: implement react
    throw UnimplementedError();
  }

  @override
  Future<(Map<String, dynamic>?, ResponseType)> view() {
    // TODO: implement view
    throw UnimplementedError();
  }

  @override
  Future<(Map<String, dynamic>?, ResponseType)> getCountries() async {
    var res = await appClient.sendRequest(endpoint: 'countries/all');
    return res;
  }
}
