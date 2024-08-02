// To parse this JSON data, do
//
//     final signUpProcessCompleteResponse = signUpProcessCompleteResponseFromJson(jsonString);

import 'dart:convert';

import '../../../../../logic/models/app/user_model.dart';

SignUpProcessCompleteResponse signUpProcessCompleteResponseFromJson(
        String str) =>
    SignUpProcessCompleteResponse.fromJson(json.decode(str));

String signUpProcessCompleteResponseToJson(
        SignUpProcessCompleteResponse data) =>
    json.encode(data.toJson());

class SignUpProcessCompleteResponse {
  bool status;
  int statusCode;
  String message;
  Data data;

  SignUpProcessCompleteResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  SignUpProcessCompleteResponse copyWith({
    bool? status,
    int? statusCode,
    String? message,
    Data? data,
  }) =>
      SignUpProcessCompleteResponse(
        status: status ?? this.status,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory SignUpProcessCompleteResponse.fromJson(Map<String, dynamic> json) =>
      SignUpProcessCompleteResponse(
        status: json["status"],
        statusCode: json["statusCode"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "statusCode": statusCode,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  String token;
  User user;

  Data({
    required this.token,
    required this.user,
  });

  Data copyWith({
    String? token,
    User? user,
  }) =>
      Data(
        token: token ?? this.token,
        user: user ?? this.user,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user.toJson(),
      };
}
