import 'package:dio/dio.dart';

import 'package:recenth_posts/src/utils/constants/global_constants.dart';

import '../../../services/storage_service/local_storage_service.dart';

class ClientOptions {
  static LocalStgService localStgService = LocalStgService();

  static BaseOptions getOptions(
          {bool isAuth = false, bool isGetRequest = true}) =>
      BaseOptions(
        baseUrl: 'http://127.0.0.1:8000/rp_api/',
        headers: isAuth
            ? {
                'Authorization': 'Bearer yourtokenhere',
                'Content-Type': 'application/json',
                GlobalConstants.CSRF_TOKEN_KEY:
                    localStgService.getData(GlobalConstants.CSRF_TOKEN)
              }
            : {
                'Content-Type': 'application/json',
                GlobalConstants.CSRF_TOKEN:
                    localStgService.getData(GlobalConstants.CSRF_TOKEN)
              },
        sendTimeout: isGetRequest ? null : const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 60),
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        validateStatus: (status) {
          return status! >= 200 && status < 400;
        },
      );
}
