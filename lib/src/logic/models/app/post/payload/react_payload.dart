// To parse this JSON data, do
//
//     final reactPayload = reactPayloadFromJson(jsonString);

import 'dart:convert';

ReactPayload reactPayloadFromJson(String str) => ReactPayload.fromJson(json.decode(str));

String reactPayloadToJson(ReactPayload data) => json.encode(data.toJson());

class ReactPayload {
    final int? refType;
    final int? parentCommentId;
    final int? userId;
    final int? reactId;
    final dynamic postId;

    ReactPayload({
        this.refType,
        this.parentCommentId,
        this.userId,
        this.reactId,
        this.postId,
    });

    ReactPayload copyWith({
        int? refType,
        int? parentCommentId,
        int? userId,
        int? reactId,
        dynamic postId,
    }) => 
        ReactPayload(
            refType: refType ?? this.refType,
            parentCommentId: parentCommentId ?? this.parentCommentId,
            userId: userId ?? this.userId,
            reactId: reactId ?? this.reactId,
            postId: postId ?? this.postId,
        );

    factory ReactPayload.fromJson(Map<String, dynamic> json) => ReactPayload(
        refType: json["ref_type"],
        parentCommentId: json["parent_comment_id"],
        userId: json["user_id"],
        reactId: json["react_id"],
        postId: json["post_id"],
    );

    Map<String, dynamic> toJson() => {
        "ref_type": refType,
        "parent_comment_id": parentCommentId,
        "user_id": userId,
        "react_id": reactId,
        "post_id": postId,
    };
}
