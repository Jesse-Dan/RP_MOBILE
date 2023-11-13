import 'package:recenth_posts/src/utils/constants/global_constants.dart';

import '../../../utils/enums/enums.dart';
import '../../services/storage_service/local_storage_service.dart';

mixin ClientUtils {
  static final LocalStgService _localStgService = LocalStgService();

  static BaseOptions getOptions({
    bool isAuth = false,
    bool isCSRFProtected = false,
  }) {
    String? csrfToken = _localStgService.getData(GlobalConstants.CSRF_TOKEN);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    if (isCSRFProtected) {
      headers[GlobalConstants.CSRF_TOKEN_KEY] = csrfToken ?? '';
    }

    if (isCSRFProtected && isAuth) {
      headers['Authorization'] = 'Bearer 977779797979';
    }

    return BaseOptions(
      baseUrl: GlobalConstants.BASE_URL,
      headers: headers,
      sendTimeout: isAuth ? null : const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 60),
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
