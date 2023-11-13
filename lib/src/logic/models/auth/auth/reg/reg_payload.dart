// To parse this JSON data, do
//
//     final regPayload = regPayloadFromJson(jsonString);

import 'dart:convert';

RegPayload regPayloadFromJson(String str) => RegPayload.fromJson(json.decode(str));

String regPayloadToJson(RegPayload data) => json.encode(data.toJson());

class RegPayload {
    final String? firstName;
    final String? lastName;
    final String? email;
    final String? password;
    final String? confirmPassword;
    final String? secreatKey;
    final int? country;

    RegPayload({
        this.firstName,
        this.lastName,
        this.email,
        this.password,
        this.confirmPassword,
        this.secreatKey,
        this.country,
    });

    RegPayload copyWith({
        String? firstName,
        String? lastName,
        String? email,
        String? password,
        String? confirmPassword,
        String? secreatKey,
        int? country,
    }) => 
        RegPayload(
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            email: email ?? this.email,
            password: password ?? this.password,
            confirmPassword: confirmPassword ?? this.confirmPassword,
            secreatKey: secreatKey ?? this.secreatKey,
            country: country ?? this.country,
        );

    factory RegPayload.fromJson(Map<String, dynamic> json) => RegPayload(
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        password: json["password"],
        confirmPassword: json["confirm_password"],
        secreatKey: json["secreat_key"],
        country: json["country"],
    );

    Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "password": password,
        "confirm_password": confirmPassword,
        "secreat_key": secreatKey,
        "country": country,
    };
}
