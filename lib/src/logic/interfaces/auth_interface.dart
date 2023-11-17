import '../../utils/enums/enums.dart';
import '../models/auth/auth/login/login_payload.dart';
import '../models/auth/auth/reg/reg_payload.dart';

mixin AuthInterface {
  Future<(Map<String, dynamic>?, ResponseType)> login({required LoginPayload loginPayload});
  Future<(Map<String, dynamic>?, ResponseType)> register({required RegPayload regPayload});
}
