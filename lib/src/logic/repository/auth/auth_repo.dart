import 'package:recenth_posts/src/logic/interfaces/login_interface.dart';
import 'package:recenth_posts/src/logic/interfaces/reg_interface.dart';
import 'package:recenth_posts/src/logic/models/auth/auth/login/login_payload.dart';
import 'package:recenth_posts/src/logic/models/auth/auth/reg/reg_payload.dart';
import 'package:recenth_posts/src/logic/models/auth/auth/reg/reg_response.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';

import '../../core/client.dart';
import '../../models/auth/auth/login/login_response.dart';

class AuthRepository implements LoginInterface, RegInterface {
  ApiClient appClient = ApiClient();

  @override
  Future<RegResponse>? register({required RegPayload regPayload}) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<LoginResponse?> login({required LoginPayload loginPayload}) async {
    var call = await appClient.sendRequest(
        method: HttpMethod.post,
        endpoint: 'auth/login',
        isCSRFProtected: true,
        body: loginPayload.toJson());
    if (call.$1 != null) {
      var res = LoginResponse.fromJson(
        call.$1!,
      );
      return res;
    }
    return null;
  }
}
