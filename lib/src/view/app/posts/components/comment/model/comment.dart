// To parse this JSON data, do
//
//     final comment = commentFromJson(jsonString);

import 'dart:convert';

Comment commentFromJson(String str) => Comment.fromJson(json.decode(str));

String commentToJson(Comment data) => json.encode(data.toJson());

class Comment {
  int? id;
  int? userId;
  String? comment;
  int? refId;
  String? refName;

  Comment({
     this.id,
     this.userId,
     this.comment,
     this.refId,
     this.refName,
  });

  Comment copyWith({
    int? id,
    int? userId,
    String? comment,
    int? refId,
    String? refName,
  }) =>
      Comment(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        comment: comment ?? this.comment,
        refId: refId ?? this.refId,
        refName: refName ?? this.refName,
      );

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        userId: json["user_id"],
        comment: json["comment"],
        refId: json["ref_id"],
        refName: json["ref_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "comment": comment,
        "ref_id": refId,
        "ref_name": refName,
      };
}
