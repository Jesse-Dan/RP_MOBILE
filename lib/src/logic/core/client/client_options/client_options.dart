import 'package:dio/dio.dart';

class ClientOptions {
 

  static BaseOptions getOptions() {
    return BaseOptions(
      method: 'http://127.0.0.1:8000/rp_api/',
      headers: {
        'Authorization': 'Bearer yourtokenhere',
        'Content-Type': 'application/json',
      },
      sendTimeout: const Duration(seconds: 5000), // 5 seconds
      receiveTimeout: const Duration(seconds: 3000), // 3 seconds
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      validateStatus: (status) {
        return status! >= 200 && status < 400;
      },
    );
  }
}
