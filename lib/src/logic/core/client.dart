import 'dart:async';
import 'dart:convert';

import 'package:recenth_posts/src/logic/core/service_selector.dart';
import 'package:recenth_posts/src/logic/models/service/un_auth_response.dart';
import 'package:recenth_posts/src/logic/services/logger/logger.dart';
import 'package:http/http.dart' as http;

import '../../utils/enums/enums.dart';
import '../exception/client_exception.dart';
import '../interfaces/client_interface.dart';
import 'client_options/client_options.dart';

class ApiClient with ClientInterface, ClientUtils {
  Future<(Map<String, dynamic>?, ResponseType, String)> handleResponse(
      http.Response response) async {
    if (response.statusCode < 400) {
      return (
        json.decode(response.body) as Map<String, dynamic>,
        ResponseType.Success,
        json.decode(response.body)['message'].toString()
      );
    }

    var res = GeneralErrorResponse.fromJson(
        json.decode(response.body) as Map<String, dynamic>);
    // return (null, ResponseType.Error, res.message!);
    return (
      json.decode(response.body) as Map<String, dynamic>,
      ResponseType.Error,
      res.message!
    );
  }

  Future<(Map<String, dynamic>?, ResponseType, String)> sendRequest({
    required String endpoint,
    HttpMethod method = HttpMethod.get,
    Map<String, dynamic>? queryParams,
    bool authenticated = false,
    Map<String, dynamic>? body,
    Service service = Service.AUTH_SERVICE,
  }) async {
    try {
      Logger.log(
          tag: Tag.DIO_REQUEST,
          message:
              'Request Body: $body \n Request Method: $method \n Request URL: $endpoint');
      final response = await makeRequest(
              '${ClientUtils.getOptions(
                isAuth: authenticated,
              ).baseUrl!}'
              '$endpoint',
              method: method,
              queryParams: queryParams,
              headers: ClientUtils.getOptions(
                isAuth: authenticated,
              ).headers,
              body: json.encode(body))
          .timeout(ClientUtils.getOptions().receiveTimeout!, onTimeout: () {
        throw TimeoutException('Request timed out after 50000 seconds');
      }).catchError((error) {
        throw error;
      });
      Logger.log(message: response.request?.url.toString() ?? 'NILL');

      return await handleResponse(response);
    } on TimeoutException catch (error, s) {
      Logger.log(
          usePrint: true,
          message: 'Timeout Error: ${error.message}',
          tag: Tag.ERROR,
          error: error,
          stackTrace: s);

      return (
        null,
        ResponseType.TIME_OUT,
        error.message ?? 'TimeOut Exception'
      );
    } on ClientException catch (error, s) {
      Logger.log(
          usePrint: true,
          message: 'Client Error: ${error.message}',
          tag: Tag.ERROR,
          error: error,
          stackTrace: s);
      return (null, ResponseType.CLIENT_ERROR, 'Network Error');
    } catch (error, s) {
      Logger.log(
          usePrint: true,
          message: 'Unkown Error: ${error.toString()}',
          tag: Tag.ERROR,
          error: error,
          stackTrace: s);
      return (null, ResponseType.UNKNOWN_ERROR, 'Unexpected Error');
    }
  }
}
