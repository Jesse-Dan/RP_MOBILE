import 'package:recenth_posts/src/logic/core/service_selector.dart';
import 'package:recenth_posts/src/logic/interfaces/auth_interface.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:recenth_posts/src/view/auth/sign_in_view/models/signin_payload.dart';
import 'package:recenth_posts/src/view/auth/sign_up_view/model/payload/signup_payload.dart';

import '../../../view/auth/sign_up_view/model/payload/verify_otp_payload.dart';
import '../../core/client.dart';

class AuthRepository implements AuthInterface {
  ApiClient appClient = ApiClient();

  @override
  Future<(Map<String, dynamic>?, ResponseType, String)> register(
      {required SignUpPayload signUpPayload}) async {
    var res = await appClient.sendRequest(
        endpoint: 'auth/register',
        method: HttpMethod.post,
        body: signUpPayload.toJson());
    return res;
  }

  @override
  Future<(Map<String, dynamic>?, ResponseType, String)> sendOtp(
      {required String email}) async {
    var res = await appClient.sendRequest(
      endpoint: 'auth/register/send-otp-mail/$email',
      method: HttpMethod.get,
    );
    return res;
  }

  Future<(Map<String, dynamic>?, ResponseType, String)> verifyOtp(
      {required VerifyOtpPayload verifyOtpPayload}) async {
    var res = await appClient.sendRequest(
        endpoint: 'auth/register/verify-otp',
        method: HttpMethod.post,
        body: verifyOtpPayload.toJson());
    return res;
  }

  @override
  Future<(Map<String, dynamic>?, ResponseType, String)> login(
      {required SigninPayload signinPayload}) async {
    var res = await appClient.sendRequest(
      endpoint: 'auth/login',
      method: HttpMethod.post,
      body: signinPayload.toJson(),
    );
    return res;
  }
}
