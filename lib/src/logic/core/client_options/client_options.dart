import 'package:recenth_posts/src/logic/core/service_selector.dart';
import 'package:recenth_posts/src/logic/services/location_service/local_storage_service.dart';
import 'package:recenth_posts/src/utils/constants/global_constants.dart';

import '../../../utils/enums/enums.dart';

mixin ClientUtils {
  static BaseOptions getOptions({
    bool isAuth = true,
    Service service = Service.AUTH_SERVICE,
  }) {
    String? bearerToken =
        LocalStorageService.getString(GlobalConstants.BEARER_TOKEN);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'x-api-key': 'd7J\$kLz1p@Gm4xQw9!R6nYb2^T8vEWq0Z*fOj5L&yHgX3rU'
    };

    if (isAuth) {
      headers['Authorization'] = 'Bearer $bearerToken';
    }

    return BaseOptions(
      baseUrl: service.url,
      headers: headers,
      sendTimeout: isAuth ? null : const Duration(seconds: 8),
      receiveTimeout: const Duration(seconds: 8),
      contentType: 'application/json',
      validateStatus: (status) {
        return status! >= 200 && status < 400;
      },
    );
  }
}

class BaseOptions {
  final String? baseUrl;
  final Map<String, String>? headers;
  final Duration? sendTimeout;
  final Duration? receiveTimeout;
  final String? contentType;
  final ResponseType? responseType;
  final bool Function(int?)? validateStatus;

  BaseOptions({
    this.baseUrl,
    this.headers,
    this.sendTimeout,
    this.receiveTimeout,
    this.contentType,
    this.responseType,
    this.validateStatus,
  });
}
