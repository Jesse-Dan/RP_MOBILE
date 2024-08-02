// To parse this JSON data, do
//
//     final otpSentResponse = otpSentResponseFromJson(jsonString);

import 'dart:convert';

OtpSentResponse otpSentResponseFromJson(String str) => OtpSentResponse.fromJson(json.decode(str));

String otpSentResponseToJson(OtpSentResponse data) => json.encode(data.toJson());

class OtpSentResponse {
    bool status;
    int statusCode;
    String message;
    Data data;

    OtpSentResponse({
        required this.status,
        required this.statusCode,
        required this.message,
        required this.data,
    });

    OtpSentResponse copyWith({
        bool? status,
        int? statusCode,
        String? message,
        Data? data,
    }) => 
        OtpSentResponse(
            status: status ?? this.status,
            statusCode: statusCode ?? this.statusCode,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory OtpSentResponse.fromJson(Map<String, dynamic> json) => OtpSentResponse(
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
    String otp;
    String sessionId;

    Data({
        required this.otp,
        required this.sessionId,
    });

    Data copyWith({
        String? otp,
        String? sessionId,
    }) => 
        Data(
            otp: otp ?? this.otp,
            sessionId: sessionId ?? this.sessionId,
        );

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        otp: json["otp"],
        sessionId: json["session_id"],
    );

    Map<String, dynamic> toJson() => {
        "otp": otp,
        "session_id": sessionId,
    };
}
