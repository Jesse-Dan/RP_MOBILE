// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final genericResponse = genericResponseFromJson(jsonString);
import 'dart:convert';

GenericResponse genericResponseFromJson(String str) => GenericResponse.fromJson(json.decode(str));

String genericResponseToJson(GenericResponse data) => json.encode(data.toJson());

class GenericResponse {
  bool status;
  int statusCode;
  String message;
  List<dynamic> data;

  GenericResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  GenericResponse copyWith({
    bool? status,
    int? statusCode,
    String? message,
    List<dynamic>? data,
  }) =>
      GenericResponse(
        status: status ?? this.status,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory GenericResponse.fromJson(Map<String, dynamic> json) => GenericResponse(
    status: json["status"],
    statusCode: json["statusCode"],
    message: json["message"],
    data: List<dynamic>.from(json["data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "statusCode": statusCode,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x)),
  };

  @override
  String toString() {
    return 'GenericResponse(status: $status, statusCode: $statusCode, message: $message, data: $data)';
  }
}
