// To parse this JSON data, do
//
//     final view = viewFromJson(jsonString);

import 'dart:convert';


View viewFromJson(String str) => View.fromJson(json.decode(str));

String viewToJson(View data) => json.encode(data.toJson());

class View {
  int? id;
  int? userId;
  int? refId;
  String? refName;
  DateTime? createdAt;
  DateTime? updatedAt;

  View({
     this.id,
     this.userId,
     this.refId,
     this.refName,
     this.createdAt,
     this.updatedAt,
  });

  View copyWith({
    int? id,
    int? userId,
    int? refId,
    String? refName,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      View(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        refId: refId ?? this.refId,
        refName: refName ?? this.refName,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory View.fromJson(Map<String, dynamic> json) => View(
        id: json["id"],
        userId: json["user_id"],
        refId: json["ref_id"],
        refName: json["ref_name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "ref_id": refId,
        "ref_name": refName,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
