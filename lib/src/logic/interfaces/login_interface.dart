import '../models/auth/auth/login/login_payload.dart';
import '../models/auth/auth/login/login_response.dart';
import '../models/auth/auth/reg/reg_payload.dart';
import '../models/auth/auth/reg/reg_response.dart';

mixin AuthInterface {
  Future<LoginResponse?> login({required LoginPayload loginPayload});
  Future<RegResponse>? register({required RegPayload regPayload});
}
