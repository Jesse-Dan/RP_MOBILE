import 'package:recenth_posts/src/logic/core/client/client_options/client_options.dart';
import 'package:recenth_posts/src/logic/core/interceptors/error_interceptor.dart';

import '../../../utils/enums/enums.dart';
import '../../../utils/logger/logger.dart';
import '../../interfaces/client_interface.dart';
import 'package:dio/dio.dart';
import 'package:recenth_posts/src/logic/models/service/base_response.dart';

class AppClient implements ClientInterface {
  late Dio _dio;

  AppClient() {
    _dio = Dio();
    _dio.options = ClientOptions.getOptions();
    // Initialize Dio
    _dio.interceptors.add(ErrorInterceptor());
    _dio.interceptors.add(ErrorInterceptor());
    _dio.interceptors.add(ErrorInterceptor());
  }

  @override
  Future<BaseResponse> delete(String endpoint) async {
    try {
      Response response = await _dio.delete(endpoint);
      return BaseResponse(data: response.data);
    } catch (e) {
      Logger(tag: Tag.ERROR, error: e, message: e.toString());
      rethrow;
    }
  }

  @override
  Future<BaseResponse> patch(String endpoint,
      {Map<String, dynamic>? data}) async {
    try {
      Response response = await _dio.patch(endpoint, data: data);
      return BaseResponse(data: response.data);
    } catch (e) {
      Logger(tag: Tag.ERROR, error: e, message: e.toString());
      rethrow;
    }
  }

  @override
  Future<BaseResponse> post(String endpoint,
      {Map<String, dynamic>? data}) async {
    try {
      Response response = await _dio.post(endpoint, data: data);
      return BaseResponse(data: response.data);
    } catch (e) {
      Logger(tag: Tag.ERROR, error: e, message: e.toString());
      rethrow;
    }
  }

  @override
  Future<BaseResponse> put(String endpoint,
      {Map<String, dynamic>? data}) async {
    try {
      Response response = await _dio.put(endpoint, data: data);
      return BaseResponse(data: response.data);
    } catch (e) {
      Logger(tag: Tag.ERROR, error: e, message: e.toString());
      rethrow;
    }
  }

  @override
  Future<BaseResponse> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      Response response =
          await _dio.get(endpoint, queryParameters: queryParameters);
      return BaseResponse(data: response.data);
    } catch (e) {
      Logger(tag: Tag.ERROR, error: e, message: e.toString());
      rethrow;
    }
  }

  @override
  Future<BaseResponse> download(String url) async {
    try {
      Response response = await _dio.get(url);
      return BaseResponse(data: response.data);
    } catch (e) {
      Logger(tag: Tag.ERROR, error: e, message: e.toString());
      rethrow;
    }
  }

  @override
  Future<BaseResponse> listenToAStream(String endpoint) {
    // TODO: implement listenToAStream
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse> uploadFiles(String endpoint,
      {required List<dynamic> files}) {
    // TODO: implement uploadFiles
    throw UnimplementedError();
  }
}
