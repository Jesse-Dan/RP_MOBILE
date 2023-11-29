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
    final String? token;
    final User? user;

    Data({
        this.token,
        this.user,
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
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "user": user?.toJson(),
    };
}

class User {
    final int? id;
    final String? firstName;
    final String? lastName;
    final String? email;
    final String? password;
    final String? confirmPassword;
    final String? secreatKey;
    final dynamic country;

    User({
        this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.password,
        this.confirmPassword,
        this.secreatKey,
        this.country,
    });

    User copyWith({
        int? id,
        String? firstName,
        String? lastName,
        String? email,
        String? password,
        String? confirmPassword,
        String? secreatKey,
        dynamic country,
    }) => 
        User(
            id: id ?? this.id,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            email: email ?? this.email,
            password: password ?? this.password,
            confirmPassword: confirmPassword ?? this.confirmPassword,
            secreatKey: secreatKey ?? this.secreatKey,
            country: country ?? this.country,
        );

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        password: json["password"],
        confirmPassword: json["confirm_password"],
        secreatKey: json["secreat_key"],
        country: json["country"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "password": password,
        "confirm_password": confirmPassword,
        "secreat_key": secreatKey,
        "country": country,
    };
}
