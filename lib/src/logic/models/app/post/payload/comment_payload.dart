// To parse this JSON data, do
//
//     final commentPayload = commentPayloadFromJson(jsonString);

import 'dart:convert';

CommentPayload commentPayloadFromJson(String str) => CommentPayload.fromJson(json.decode(str));

String commentPayloadToJson(CommentPayload data) => json.encode(data.toJson());

class CommentPayload {
    final int? refType;
    final int? parentCommentId;
    final int? userId;
    final String? comment;
    final dynamic postId;

    CommentPayload({
        this.refType,
        this.parentCommentId,
        this.userId,
        this.comment,
        this.postId,
    });

    CommentPayload copyWith({
        int? refType,
        int? parentCommentId,
        int? userId,
        String? comment,
        dynamic postId,
    }) => 
        CommentPayload(
            refType: refType ?? this.refType,
            parentCommentId: parentCommentId ?? this.parentCommentId,
            userId: userId ?? this.userId,
            comment: comment ?? this.comment,
            postId: postId ?? this.postId,
        );

    factory CommentPayload.fromJson(Map<String, dynamic> json) => CommentPayload(
        refType: json["ref_type"],
        parentCommentId: json["parent_comment_id"],
        userId: json["user_id"],
        comment: json["comment"],
        postId: json["post_id"],
    );

    Map<String, dynamic> toJson() => {
        "ref_type": refType,
        "parent_comment_id": parentCommentId,
        "user_id": userId,
        "comment": comment,
        "post_id": postId,
    };
}
