import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:recenth_posts/src/logic/models/service/un_auth_response.dart';
import 'package:recenth_posts/src/logic/services/logger/logger.dart';

import '../../utils/enums/enums.dart';
import '../exception/client_exception.dart';
import '../interfaces/client_interface.dart';
import 'client_options/client_options.dart';

class ApiClient with ClientInterface, ClientUtils {
  ApiClient();

  Future<(Map<String, dynamic>?, ResponseType)> handleResponse(
      http.Response response) async {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return (
        json.decode(response.body) as Map<String, dynamic>,
        ResponseType.Success
      );
    }
    if (response.statusCode == 400 ||
        response.statusCode == 405 ||
        response.statusCode == 419 ||
        response.statusCode == 404) {
      var res = GeneralErrorResponse.fromJson(
          json.decode(response.body) as Map<String, dynamic>);
      return (res.toJson(), ResponseType.Error);
    } else {
      return (
        json.decode(response.body) as Map<String, dynamic>,
        ResponseType.Error
      );
    }
  }

  Future<(Map<String, dynamic>?, ResponseType)> sendRequest({
    required String endpoint,
    HttpMethod method = HttpMethod.get,
    Map<String, dynamic>? queryParams,
    bool isAuth = false,
    dynamic body,
  }) async {
    try {
      final response = await makeRequest(
              '${ClientUtils.getOptions(
                isAuth: isAuth,
              ).baseUrl!}'
              '$endpoint',
              method: method,
              queryParams: queryParams,
              headers: ClientUtils.getOptions(
                isAuth: isAuth,
              ).headers,
              body: json.encode(body))
          .timeout(const Duration(seconds: 50000), onTimeout: () {
        throw TimeoutException('Request timed out after 50000 seconds');
      });
      return await handleResponse(response);
    } on TimeoutException catch (error, s) {
      Logger.log(
          message: 'Error: ${error.message}',
          tag: Tag.ERROR,
          error: error,
          stackTrace: s);
      return (null, ResponseType.TIME_OUT);
    } on ClientException catch (error, s) {
      Logger.log(
          message: 'Error: ${error.message}',
          tag: Tag.ERROR,
          error: error,
          stackTrace: s);
      return (null, ResponseType.CLIENT_ERROR);
    } catch (error, s) {
      Logger.log(
          message: 'Error: ${error.toString()}',
          tag: Tag.ERROR,
          error: error,
          stackTrace: s);
      return (null, ResponseType.UNKNOWN_ERROR);
    }
  }
}

void main() async {
  final httpService = ApiClient();

  try {
    final response = await httpService.sendRequest(
      endpoint: 'https://jsonplaceholder.typicode.com/posts/1',
      method: HttpMethod.get,
    );

    if (kDebugMode) {
      print(response);
    }
  } catch (error) {
    // Handle errors specific to this use case or log them
    if (kDebugMode) {
      print('Main Error: $error');
    }
  }
}
