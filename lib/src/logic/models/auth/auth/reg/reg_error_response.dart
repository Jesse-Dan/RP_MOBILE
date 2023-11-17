// To parse this JSON data, do
//
//     final regErrorResponse = regErrorResponseFromJson(jsonString);

import 'dart:convert';

FieldErrorResponse regErrorResponseFromJson(String str) =>
    FieldErrorResponse.fromJson(json.decode(str));

String regErrorResponseToJson(FieldErrorResponse data) =>
    json.encode(data.toJson());

class FieldErrorResponse {
  final bool? status;
  final int? statusCode;
  final Message? message;
  final List<dynamic>? data;

  FieldErrorResponse({
    this.status,
    this.statusCode,
    this.message,
    this.data,
  });

  FieldErrorResponse copyWith({
    bool? status,
    int? statusCode,
    Message? message,
    List<dynamic>? data,
  }) =>
      FieldErrorResponse(
        status: status ?? this.status,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory FieldErrorResponse.fromJson(Map<String, dynamic> json) =>
      FieldErrorResponse(
        status: json["status"],
        statusCode: json["statusCode"],
        message:
            json["message"] == null ? null : Message.fromJson(json["message"]),
        data: json["data"] == null
            ? []
            : List<dynamic>.from(json["data"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "statusCode": statusCode,
        "message": message?.toJson(),
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
      };
}

class Message {
  final List<String>? email;
  final List<String>? firstName;
  final List<String>? lastName;
  final List<String>? password;
  final List<String>? confirmPassword;
  final List<String>? secreatKey;
  final List<String>? country;

  Message({
    this.email,
    this.firstName,
    this.lastName,
    this.password,
    this.confirmPassword,
    this.secreatKey,
    this.country,
  });

  Message copyWith({
    List<String>? email,
    List<String>? firstName,
    List<String>? lastName,
    List<String>? password,
    List<String>? confirmPassword,
    List<String>? secreatKey,
    List<String>? country,
  }) =>
      Message(
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        secreatKey: secreatKey ?? this.secreatKey,
        country: country ?? this.country,
      );

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        email: json["email"] == null
            ? []
            : List<String>.from(json["email"]!.map((x) => x)),
        firstName: json["first_name"] == null
            ? []
            : List<String>.from(json["first_name"]!.map((x) => x)),
        lastName: json["last_name"] == null
            ? []
            : List<String>.from(json["last_name"]!.map((x) => x)),
        password: json["password"] == null
            ? []
            : List<String>.from(json["password"]!.map((x) => x)),
        confirmPassword: json["confirm_password"] == null
            ? []
            : List<String>.from(json["confirm_password"]!.map((x) => x)),
        secreatKey: json["secreat_key"] == null
            ? []
            : List<String>.from(json["secreat_key"]!.map((x) => x)),
        country: json["country"] == null
            ? []
            : List<String>.from(json["country"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "email": email == null ? [] : List<dynamic>.from(email!.map((x) => x)),
        "first_name": firstName == null
            ? []
            : List<dynamic>.from(firstName!.map((x) => x)),
        "last_name":
            lastName == null ? [] : List<dynamic>.from(lastName!.map((x) => x)),
        "password":
            password == null ? [] : List<dynamic>.from(password!.map((x) => x)),
        "confirm_password": confirmPassword == null
            ? []
            : List<dynamic>.from(confirmPassword!.map((x) => x)),
        "secreat_key": secreatKey == null
            ? []
            : List<dynamic>.from(secreatKey!.map((x) => x)),
        "country":
            country == null ? [] : List<dynamic>.from(country!.map((x) => x)),
      };
}
