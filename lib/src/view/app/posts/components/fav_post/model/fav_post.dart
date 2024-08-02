// To parse this JSON data, do
//
//     final favPostPayload = favPostPayloadFromJson(jsonString);

import 'dart:convert';

FavPostPayload favPostPayloadFromJson(String str) =>
    FavPostPayload.fromJson(json.decode(str));

String favPostPayloadToJson(FavPostPayload data) => json.encode(data.toJson());

class FavPostPayload {
  int refId;
  String refName;

  FavPostPayload({
    required this.refId,
    required this.refName,
  });

  FavPostPayload copyWith({
    int? refId,
    String? refName,
  }) =>
      FavPostPayload(
        refId: refId ?? this.refId,
        refName: refName ?? this.refName,
      );

  factory FavPostPayload.fromJson(Map<String, dynamic> json) => FavPostPayload(
        refId: json["ref_id"],
        refName: json["ref_name"],
      );

  Map<String, dynamic> toJson() => {
        "ref_id": refId,
        "ref_name": refName,
      };
}
