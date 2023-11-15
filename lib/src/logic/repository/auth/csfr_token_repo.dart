
import 'package:recenth_posts/src/logic/services/logger/logger.dart';
import 'package:recenth_posts/src/logic/services/storage_service/local_storage_service.dart';

import 'package:recenth_posts/src/utils/constants/global_constants.dart';
import '../../../utils/enums/enums.dart';

import '../../core/client.dart';
import '../../models/auth/csfr/response.dart';


class CSFRTokenRepo extends ApiClient {
  LocalStgService localStgService = LocalStgService();

  Future<bool> getToken() async {
    try {
      var call = await sendRequest(
        endpoint: 'auth/token',
      );
      var res = CsfrResponse.fromJson(call.$1 ?? {});
      await localStgService.saveData(GlobalConstants.CSRF_TOKEN, res.data?.csrfToken);
      Logger.log(tag: Tag.SUCCESS, message: 'CSRF_TOKEN saved');
      return true;
    } catch (e, s) {
      Logger.log(
          tag: Tag.SUCCESS,
          message: 'CSRF_TOKEN could not be saved',
          error: e,
          stackTrace: s);
      return false;
    }
  }
}
