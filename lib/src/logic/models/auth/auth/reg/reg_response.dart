// To parse this JSON data, do
//
//     final regResponse = regResponseFromJson(jsonString);

import 'dart:convert';

RegResponse regResponseFromJson(String str) =>
    RegResponse.fromJson(json.decode(str));

String regResponseToJson(RegResponse data) => json.encode(data.toJson());

class RegResponse {
  final bool? status;
  final int? statusCode;
  final String? message;
  final Data? data;

  RegResponse({
    this.status,
    this.statusCode,
    this.message,
    this.data,
  });

  RegResponse copyWith({
    bool? status,
    int? statusCode,
    String? message,
    Data? data,
  }) =>
      RegResponse(
        status: status ?? this.status,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory RegResponse.fromJson(Map<String, dynamic> json) => RegResponse(
        status: json["status"],
        statusCode: json["statusCode"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "statusCode": statusCode,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  final String? firstName;
  final String? lastName;
  final String? email;
  final int? id;

  Data({
    this.firstName,
    this.lastName,
    this.email,
    this.id,
  });

  Data copyWith({
    String? firstName,
    String? lastName,
    String? email,
    int? id,
  }) =>
      Data(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        id: id ?? this.id,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "id": id,
      };
}
