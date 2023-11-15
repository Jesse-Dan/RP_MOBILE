import 'package:recenth_posts/src/logic/models/auth/auth/reg/reg_payload.dart';
import 'package:recenth_posts/src/logic/models/auth/auth/reg/reg_response.dart';

mixin RegInterface{
  Future<RegResponse>? register({required RegPayload regPayload});

}