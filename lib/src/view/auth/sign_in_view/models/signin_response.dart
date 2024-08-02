// To parse this JSON data, do
//
//     final signinResponse = signinResponseFromJson(jsonString);

import 'dart:convert';

SigninResponse signinResponseFromJson(String str) => SigninResponse.fromJson(json.decode(str));

String signinResponseToJson(SigninResponse data) => json.encode(data.toJson());

class SigninResponse {
    bool? status;
    int? statusCode;
    String? message;
    Data? data;

    SigninResponse({
        this.status,
        this.statusCode,
        this.message,
        this.data,
    });

    SigninResponse copyWith({
        bool? status,
        int? statusCode,
        String? message,
        Data? data,
    }) => 
        SigninResponse(
            status: status ?? this.status,
            statusCode: statusCode ?? this.statusCode,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory SigninResponse.fromJson(Map<String, dynamic> json) => SigninResponse(
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
    String? token;
    String? refreshToken;
    User? user;

    Data({
        this.token,
        this.refreshToken,
        this.user,
    });

    Data copyWith({
        String? token,
        String? refreshToken,
        User? user,
    }) => 
        Data(
            token: token ?? this.token,
            refreshToken: refreshToken ?? this.refreshToken,
            user: user ?? this.user,
        );

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        refreshToken: json["refresh_token"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "refresh_token": refreshToken,
        "user": user?.toJson(),
    };
}

class User {
    int? id;
    String? name;
    String? firstName;
    String? lastName;
    String? email;
    String? country;
    String? ipAddress;
    dynamic media;
    String? accountType;
    int? activeStatus;
    dynamic state;
    DateTime? emailVerifiedAt;
    dynamic rememberToken;
    String? fcm;
    int? deleted;
    dynamic deletedAt;
    String? phoneNumber;

    User({
        this.id,
        this.name,
        this.firstName,
        this.lastName,
        this.email,
        this.country,
        this.ipAddress,
        this.media,
        this.accountType,
        this.activeStatus,
        this.state,
        this.emailVerifiedAt,
        this.rememberToken,
        this.fcm,
        this.deleted,
        this.deletedAt,
        this.phoneNumber,
    });

    User copyWith({
        int? id,
        String? name,
        String? firstName,
        String? lastName,
        String? email,
        String? country,
        String? ipAddress,
        dynamic media,
        String? accountType,
        int? activeStatus,
        dynamic state,
        DateTime? emailVerifiedAt,
        dynamic rememberToken,
        String? fcm,
        int? deleted,
        dynamic deletedAt,
        String? phoneNumber,
    }) => 
        User(
            id: id ?? this.id,
            name: name ?? this.name,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            email: email ?? this.email,
            country: country ?? this.country,
            ipAddress: ipAddress ?? this.ipAddress,
            media: media ?? this.media,
            accountType: accountType ?? this.accountType,
            activeStatus: activeStatus ?? this.activeStatus,
            state: state ?? this.state,
            emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
            rememberToken: rememberToken ?? this.rememberToken,
            fcm: fcm ?? this.fcm,
            deleted: deleted ?? this.deleted,
            deletedAt: deletedAt ?? this.deletedAt,
            phoneNumber: phoneNumber ?? this.phoneNumber,
        );

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        country: json["country"],
        ipAddress: json["ip_address"],
        media: json["media"],
        accountType: json["account_type"],
        activeStatus: json["active_status"],
        state: json["state"],
        emailVerifiedAt: json["email_verified_at"] == null ? null : DateTime.parse(json["email_verified_at"]),
        rememberToken: json["remember_token"],
        fcm: json["fcm"],
        deleted: json["deleted"],
        deletedAt: json["deleted_at"],
        phoneNumber: json["phone_number"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "country": country,
        "ip_address": ipAddress,
        "media": media,
        "account_type": accountType,
        "active_status": activeStatus,
        "state": state,
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "remember_token": rememberToken,
        "fcm": fcm,
        "deleted": deleted,
        "deleted_at": deletedAt,
        "phone_number": phoneNumber,
    };
}
