// To parse this JSON data, do
//
//     final signUpResponse = signUpResponseFromJson(jsonString);

import 'dart:convert';

SignUpResponse signUpResponseFromJson(String str) => SignUpResponse.fromJson(json.decode(str));

String signUpResponseToJson(SignUpResponse data) => json.encode(data.toJson());

class SignUpResponse {
    bool status;
    int statusCode;
    String message;
    List<dynamic> data;

    SignUpResponse({
        required this.status,
        required this.statusCode,
        required this.message,
        required this.data,
    });

    SignUpResponse copyWith({
        bool? status,
        int? statusCode,
        String? message,
        List<dynamic>? data,
    }) => 
        SignUpResponse(
            status: status ?? this.status,
            statusCode: statusCode ?? this.statusCode,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
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
}
