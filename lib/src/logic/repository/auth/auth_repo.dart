import 'package:recenth_posts/src/logic/interfaces/auth_interface.dart';
import 'package:recenth_posts/src/logic/models/auth/auth/reg/reg_payload.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';

import '../../core/client.dart';
import '../../models/auth/auth/login/login_payload.dart';

class AuthRepository implements AuthInterface {
  ApiClient appClient = ApiClient();

  @override
  Future<(Map<String, dynamic>?, ResponseType)> register(
      {required RegPayload regPayload}) async {
    var res = await appClient.sendRequest(
        endpoint: 'auth/register',
        method: HttpMethod.post,
        body: regPayload.toJson());
    return res;
  }

  @override
  Future<(Map<String, dynamic>?, ResponseType)> login(
      {required LoginPayload loginPayload}) async {
     var res = await appClient.sendRequest(
        endpoint: 'auth/login',
        method: HttpMethod.post,
        body: loginPayload.toJson());
    return res;
  }
}
