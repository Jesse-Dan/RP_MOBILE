// To parse this JSON data, do
//
//     final viewResponse = viewResponseFromJson(jsonString);

import 'dart:convert';

ViewResponse viewResponseFromJson(String str) => ViewResponse.fromJson(json.decode(str));

String viewResponseToJson(ViewResponse data) => json.encode(data.toJson());

class ViewResponse {
    final bool? status;
    final int? statusCode;
    final String? message;
    final List<View>? data;

    ViewResponse({
        this.status,
        this.statusCode,
        this.message,
        this.data,
    });

    ViewResponse copyWith({
        bool? status,
        int? statusCode,
        String? message,
        List<View>? data,
    }) => 
        ViewResponse(
            status: status ?? this.status,
            statusCode: statusCode ?? this.statusCode,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory ViewResponse.fromJson(Map<String, dynamic> json) => ViewResponse(
        status: json["status"],
        statusCode: json["statusCode"],
        message: json["message"],
        data: json["data"] == null ? [] : List<View>.from(json["data"]!.map((x) => View.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "statusCode": statusCode,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class View {
    final int? id;
    final int? userId;
    final int? refId;

    View({
        this.id,
        this.userId,
        this.refId,
    });

    View copyWith({
        int? id,
        int? userId,
        int? refId,
    }) => 
        View(
            id: id ?? this.id,
            userId: userId ?? this.userId,
            refId: refId ?? this.refId,
        );

    factory View.fromJson(Map<String, dynamic> json) => View(
        id: json["id"],
        userId: json["user_id"],
        refId: json["ref_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "ref_id": refId,
    };
}
