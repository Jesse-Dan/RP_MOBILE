// To parse this JSON data, do
//
//     final viewPayload = viewPayloadFromJson(jsonString);

import 'dart:convert';

ViewPayload viewPayloadFromJson(String str) => ViewPayload.fromJson(json.decode(str));

String viewPayloadToJson(ViewPayload data) => json.encode(data.toJson());

class ViewPayload {
  int refId;
  String refName;

  ViewPayload({
    required this.refId,
    required this.refName,
  });

  ViewPayload copyWith({
    int? refId,
    String? refName,
  }) =>
      ViewPayload(
        refId: refId ?? this.refId,
        refName: refName ?? this.refName,
      );

  factory ViewPayload.fromJson(Map<String, dynamic> json) => ViewPayload(
    refId: json["ref_id"],
    refName: json["ref_name"],
  );

  Map<String, dynamic> toJson() => {
    "ref_id": refId,
    "ref_name": refName,
  };
}
