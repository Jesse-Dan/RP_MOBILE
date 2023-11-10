import 'package:dio/dio.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';

import '../../services/logger/logger.dart';
class ResponseInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Logger.log(message:
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',tag: Tag.DIO_REQUEST);
    super.onResponse(response, handler);
        return handler.next(response);

  }
}