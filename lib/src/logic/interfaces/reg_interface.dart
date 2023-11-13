import 'package:recenth_posts/src/logic/models/auth/auth/reg/reg_payload.dart';
import 'package:recenth_posts/src/logic/models/auth/auth/reg/reg_response.dart';

import '../models/service/base_response.dart';

mixin RegInterface{
  Future<RegResponse>? register({required RegPayload regPayload});

}