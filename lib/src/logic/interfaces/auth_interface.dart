
import '../../utils/enums/enums.dart';
import '../../view/auth/sign_in_view/models/signin_payload.dart';
import '../../view/auth/sign_up_view/model/payload/signup_payload.dart';

mixin AuthInterface {
  Future<(Map<String, dynamic>?, ResponseType,String)> login({required SigninPayload signinPayload});
  Future<(Map<String, dynamic>?, ResponseType,String)> register({required SignUpPayload signUpPayload});
    Future<(Map<String, dynamic>?, ResponseType,String)> sendOtp({required String email});

}
