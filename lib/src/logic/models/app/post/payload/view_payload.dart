// To parse this JSON data, do
//
//     final viewPayload = viewPayloadFromJson(jsonString);

import 'dart:convert';

ViewPayload viewPayloadFromJson(String str) => ViewPayload.fromJson(json.decode(str));

String viewPayloadToJson(ViewPayload data) => json.encode(data.toJson());

class ViewPayload {
    final int? userId;
    final int? refId;

    ViewPayload({
        this.userId,
        this.refId,
    });

    ViewPayload copyWith({
        int? userId,
        int? refId,
    }) => 
        ViewPayload(
            userId: userId ?? this.userId,
            refId: refId ?? this.refId,
        );

    factory ViewPayload.fromJson(Map<String, dynamic> json) => ViewPayload(
        userId: json["user_id"],
        refId: json["ref_id"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "ref_id": refId,
    };
}
