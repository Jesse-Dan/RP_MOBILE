import 'package:recenth_posts/src/logic/interfaces/login_interface.dart';
import 'package:recenth_posts/src/logic/models/auth/auth/reg/reg_payload.dart';
import 'package:recenth_posts/src/logic/models/auth/auth/reg/reg_response.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';

import '../../core/client.dart';
import '../../models/auth/auth/login/login_payload.dart';
import '../../models/auth/auth/login/login_response.dart';

class AuthRepository implements AuthInterface {
  ApiClient appClient = ApiClient();

  @override
  Future<RegResponse>? register({required RegPayload regPayload}) {
    throw UnimplementedError();
  }

  @override
  Future<LoginResponse?> login({required LoginPayload loginPayload}) async {
    throw UnimplementedError();
  }
}
