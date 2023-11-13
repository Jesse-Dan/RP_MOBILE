// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    final bool? status;
    final int? statusCode;
    final String? message;
    final Data? data;

    LoginResponse({
        this.status,
        this.statusCode,
        this.message,
        this.data,
    });

    LoginResponse copyWith({
        bool? status,
        int? statusCode,
        String? message,
        Data? data,
    }) => 
        LoginResponse(
            status: status ?? this.status,
            statusCode: statusCode ?? this.statusCode,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
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
    final String? bearerToken;
    final User? user;

    Data({
        this.bearerToken,
        this.user,
    });

    Data copyWith({
        String? bearerToken,
        User? user,
    }) => 
        Data(
            bearerToken: bearerToken ?? this.bearerToken,
            user: user ?? this.user,
        );

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        bearerToken: json["bearer_token"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "bearer_token": bearerToken,
        "user": user?.toJson(),
    };
}

class User {
    final int? id;
    final String? firstName;
    final String? lastName;
    final String? email;

    User({
        this.id,
        this.firstName,
        this.lastName,
        this.email,
    });

    User copyWith({
        int? id,
        String? firstName,
        String? lastName,
        String? email,
    }) => 
        User(
            id: id ?? this.id,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            email: email ?? this.email,
        );

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
    };
}
