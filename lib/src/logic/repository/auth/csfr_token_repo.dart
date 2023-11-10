import 'package:recenth_posts/src/logic/core/client/client.dart';
import 'package:recenth_posts/src/logic/services/storage_service/local_storage_service.dart';

import 'package:recenth_posts/src/utils/constants/global_constants.dart';
import '../../models/auth/csfr/response.dart';

import '../../models/service/base_response.dart';

class CSFRTokenRepo extends AppClient {
  LocalStgService localStgService = LocalStgService();

  Future<BaseResponse<CsfrResponse>> getToken() async {
    BaseResponse<CsfrResponse> res =
        get('auth/token') as BaseResponse<CsfrResponse>;
    await localStgService.saveData(GlobalConstants.CSRF_TOKEN, res.data);
    return res;
  }
}
