// To parse this JSON data, do
//
//     final star = starFromJson(jsonString);

import 'dart:convert';

Star starFromJson(String str) => Star.fromJson(json.decode(str));

String starToJson(Star data) => json.encode(data.toJson());

class Star {
  int? id;
  int? userId;
  int? refId;
  String? refName;

  Star({
     this.id,
     this.userId,
     this.refId,
     this.refName,
  });

  Star copyWith({
    int? id,
    int? userId,
    int? refId,
    String? refName,
  }) =>
      Star(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        refId: refId ?? this.refId,
        refName: refName ?? this.refName,
      );

  factory Star.fromJson(Map<String, dynamic> json) => Star(
        id: json["id"],
        userId: json["user_id"],
        refId: json["ref_id"],
        refName: json["ref_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "ref_id": refId,
        "ref_name": refName,
      };
}
