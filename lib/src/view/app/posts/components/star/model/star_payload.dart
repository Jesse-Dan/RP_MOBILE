// To parse this JSON data, do
//
//     final starPayload = starPayloadFromJson(jsonString);

import 'dart:convert';

StarPayload starPayloadFromJson(String str) => StarPayload.fromJson(json.decode(str));

String starPayloadToJson(StarPayload data) => json.encode(data.toJson());

class StarPayload {
  int refId;
  String refName;

  StarPayload({
    required this.refId,
    required this.refName,
  });

  StarPayload copyWith({
    int? refId,
    String? refName,
  }) =>
      StarPayload(
        refId: refId ?? this.refId,
        refName: refName ?? this.refName,
      );

  factory StarPayload.fromJson(Map<String, dynamic> json) => StarPayload(
    refId: json["ref_id"],
    refName: json["ref_name"],
  );

  Map<String, dynamic> toJson() => {
    "ref_id": refId,
    "ref_name": refName,
  };
}
