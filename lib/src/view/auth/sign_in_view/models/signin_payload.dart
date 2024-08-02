// To parse this JSON data, do
//
//     final signinPayload = signinPayloadFromJson(jsonString);

import 'dart:convert';

SigninPayload signinPayloadFromJson(String str) =>
    SigninPayload.fromJson(json.decode(str));

String signinPayloadToJson(SigninPayload data) => json.encode(data.toJson());

class SigninPayload {
  String email;
  String password;

  SigninPayload({
    required this.email,
    required this.password,
  });

  factory SigninPayload.fromJson(Map<String, dynamic> json) => SigninPayload(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
