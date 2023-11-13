// To parse this JSON data, do
//
//     final csfrResponse = csfrResponseFromJson(jsonString);

import 'dart:convert';

CsfrResponse csfrResponseFromJson(String str) => CsfrResponse.fromJson(json.decode(str));

String csfrResponseToJson(CsfrResponse data) => json.encode(data.toJson());

class CsfrResponse {
    final bool? status;
    final int? statusCode;
    final String? message;
    final Data? data;

    CsfrResponse({
        this.status,
        this.statusCode,
        this.message,
        this.data,
    });

    CsfrResponse copyWith({
        bool? status,
        int? statusCode,
        String? message,
        Data? data,
    }) => 
        CsfrResponse(
            status: status ?? this.status,
            statusCode: statusCode ?? this.statusCode,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory CsfrResponse.fromJson(Map<String, dynamic> json) => CsfrResponse(
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
    final String? csrfToken;

    Data({
        this.csrfToken,
    });

    Data copyWith({
        String? csrfToken,
    }) => 
        Data(
            csrfToken: csrfToken ?? this.csrfToken,
        );

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        csrfToken: json["CSRF-TOKEN"],
    );

    Map<String, dynamic> toJson() => {
        "CSRF-TOKEN": csrfToken,
    };
}
