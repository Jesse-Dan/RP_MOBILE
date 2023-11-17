// To parse this JSON data, do
//
//     final unAuthResponse = unAuthResponseFromJson(jsonString);

import 'dart:convert';

GeneralErrorResponse unAuthResponseFromJson(String str) =>
    GeneralErrorResponse.fromJson(json.decode(str));

String unAuthResponseToJson(GeneralErrorResponse data) =>
    json.encode(data.toJson());

class GeneralErrorResponse {
  final bool? status;
  final int? statusCode;
  final String? message;

  GeneralErrorResponse({
    this.status,
    this.statusCode,
    this.message,
  });

  GeneralErrorResponse copyWith({
    bool? status,
    int? statusCode,
    String? message,
  }) =>
      GeneralErrorResponse(
        status: status ?? this.status,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
      );

  factory GeneralErrorResponse.fromJson(Map<String, dynamic> json) =>
      GeneralErrorResponse(
        status: json["status"],
        statusCode: json["status_code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "status_code": statusCode,
        "message": message,
      };
}
