import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recenth_posts/src/logic/services/logger/logger.dart';

import '../../utils/enums/enums.dart';
import '../exception/client_exception.dart';
import '../interfaces/client_interface.dart';
import 'client_options/client_options.dart';

class ApiClient with ClientInterface, ClientUtils {
  ApiClient();

  Future<(Map<String, dynamic>, ResponseType)> handleResponse(
      http.Response response) async {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return (
        json.decode(response.body) as Map<String, dynamic>,
        ResponseType.Success
      );
    } else {
      throw ClientException(
          'Request failed with status: ${response.statusCode}\nError Message: ${response.reasonPhrase}');
    }
  }

  Future<(Map<String, dynamic>?, ResponseType)> sendRequest({
    required String endpoint,
    HttpMethod method = HttpMethod.get,
    Map<String, dynamic>? queryParams,
    bool isAuth = false,
    bool isCSRFProtected = true,
    dynamic body,
  }) async {
    try {
      final response = await makeRequest(
              ClientUtils.getOptions(
                          isAuth: isAuth, isCSRFProtected: isCSRFProtected)
                      .baseUrl! +
                  endpoint,
              method: method,
              queryParams: queryParams,
              headers: ClientUtils.getOptions(
                      isAuth: isAuth, isCSRFProtected: isCSRFProtected)
                  .headers,
              body: body)
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
      return (null, ResponseType.Error);
    } catch (error, s) {
      Logger.log(
          message: 'Error: ${error.toString()}',
          tag: Tag.ERROR,
          error: error,
          stackTrace: s);
      return (null, ResponseType.Error);
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

    print(response);
  } catch (error) {
    // Handle errors specific to this use case or log them
    print('Main Error: $error');
  }
}
