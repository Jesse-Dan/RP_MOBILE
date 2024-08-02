// To parse this JSON data, do
//
//     final commentPayload = commentPayloadFromJson(jsonString);

import 'dart:convert';

CommentPayload commentPayloadFromJson(String str) => CommentPayload.fromJson(json.decode(str));

String commentPayloadToJson(CommentPayload data) => json.encode(data.toJson());

class CommentPayload {
  String comment;
  int refId;
  String refName;

  CommentPayload({
    required this.comment,
    required this.refId,
    required this.refName,
  });

  CommentPayload copyWith({
    String? comment,
    int? refId,
    String? refName,
  }) =>
      CommentPayload(
        comment: comment ?? this.comment,
        refId: refId ?? this.refId,
        refName: refName ?? this.refName,
      );

  factory CommentPayload.fromJson(Map<String, dynamic> json) => CommentPayload(
    comment: json["comment"],
    refId: json["ref_id"],
    refName: json["ref_name"],
  );

  Map<String, dynamic> toJson() => {
    "comment": comment,
    "ref_id": refId,
    "ref_name": refName,
  };
}
