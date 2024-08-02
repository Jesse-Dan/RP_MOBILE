// To parse this JSON data, do
//
//     final signUpPayload = signUpPayloadFromJson(jsonString);

import 'dart:convert';

SignUpPayload signUpPayloadFromJson(String str) => SignUpPayload.fromJson(json.decode(str));

String signUpPayloadToJson(SignUpPayload data) => json.encode(data.toJson());

class SignUpPayload {
    String firstName;
    String lastName;
    String email;
    String secreatKey;
    String password;

    SignUpPayload({
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.secreatKey,
        required this.password,
    });

    SignUpPayload copyWith({
        String? firstName,
        String? lastName,
        String? email,
        String? secreatKey,
        String? password,
    }) => 
        SignUpPayload(
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            email: email ?? this.email,
            secreatKey: secreatKey ?? this.secreatKey,
            password: password ?? this.password,
        );

    factory SignUpPayload.fromJson(Map<String, dynamic> json) => SignUpPayload(
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        secreatKey: json["secreat_key"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "secreat_key": secreatKey,
        "password": password,
    };
}
