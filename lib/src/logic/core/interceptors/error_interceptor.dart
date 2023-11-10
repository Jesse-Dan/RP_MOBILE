import 'package:dio/dio.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';

import '../../services/logger/logger.dart';

class ErrorInterceptor extends Interceptor {
  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    Logger.log(
        message:
            'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
        tag: Tag.ERROR);
    super.onError(err, handler);
    return handler.next(err);
  }
}
