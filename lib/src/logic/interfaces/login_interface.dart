import 'package:recenth_posts/src/logic/models/auth/auth/login/login_payload.dart';

import '../models/auth/auth/login/login_response.dart';

mixin LoginInterface{

  Future<LoginResponse?> login({required LoginPayload loginPayload});

  
}