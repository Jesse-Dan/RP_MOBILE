import 'package:recenth_posts/src/logic/models/service/base_response.dart';

 mixin ClientInterface {
  /// Perform a GET request.
  Future<BaseResponse> get(String endpoint, {Map<String, dynamic>? queryParameters});

  /// Perform a POST request.
  Future<BaseResponse> post(String endpoint, {Map<String, dynamic>? data});

  /// Perform a DELETE request.
  Future<BaseResponse> delete(String endpoint);

  /// Perform a PATCH request.
  Future<BaseResponse> patch(String endpoint, {Map<String, dynamic>? data});

  /// Perform a PUT request.
  Future<BaseResponse> put(String endpoint, {Map<String, dynamic>? data});

  /// Download a file.
  Future<BaseResponse> download(String url);

  /// Upload files.
  Future<BaseResponse> uploadFiles(String endpoint, {required List<dynamic> files});

  /// Listen to a stream.
  Future<BaseResponse> listenToAStream(String endpoint);
}
