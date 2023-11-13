// To parse this JSON data, do
//
//     final unAuthResponse = unAuthResponseFromJson(jsonString);

import 'dart:convert';

UnAuthResponse unAuthResponseFromJson(String str) => UnAuthResponse.fromJson(json.decode(str));

String unAuthResponseToJson(UnAuthResponse data) => json.encode(data.toJson());

class UnAuthResponse {
    final bool? status;
    final int? statusCode;
    final String? message;

    UnAuthResponse({
        this.status,
        this.statusCode,
        this.message,
    });

    UnAuthResponse copyWith({
        bool? status,
        int? statusCode,
        String? message,
    }) => 
        UnAuthResponse(
            status: status ?? this.status,
            statusCode: statusCode ?? this.statusCode,
            message: message ?? this.message,
        );

    factory UnAuthResponse.fromJson(Map<String, dynamic> json) => UnAuthResponse(
        status: json["status"],
        statusCode: json["status_code"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "status_code": statusCode,
        "message": message,
    };
}
