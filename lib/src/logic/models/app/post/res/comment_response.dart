// To parse this JSON data, do
//
//     final commentResponse = commentResponseFromJson(jsonString);

import 'dart:convert';

CommentResponse commentResponseFromJson(String str) => CommentResponse.fromJson(json.decode(str));

String commentResponseToJson(CommentResponse data) => json.encode(data.toJson());

class CommentResponse {
    final bool? status;
    final int? statusCode;
    final String? message;
    final List<Comment>? data;

    CommentResponse({
        this.status,
        this.statusCode,
        this.message,
        this.data,
    });

    CommentResponse copyWith({
        bool? status,
        int? statusCode,
        String? message,
        List<Comment>? data,
    }) => 
        CommentResponse(
            status: status ?? this.status,
            statusCode: statusCode ?? this.statusCode,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory CommentResponse.fromJson(Map<String, dynamic> json) => CommentResponse(
        status: json["status"],
        statusCode: json["statusCode"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Comment>.from(json["data"]!.map((x) => Comment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "statusCode": statusCode,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Comment {
    final int? id;
    final int? userId;
    final String? comment;
    final dynamic postId;
    final int? parentCommentId;
    final int? refType;

    Comment({
        this.id,
        this.userId,
        this.comment,
        this.postId,
        this.parentCommentId,
        this.refType,
    });

    Comment copyWith({
        int? id,
        int? userId,
        String? comment,
        dynamic postId,
        int? parentCommentId,
        int? refType,
    }) => 
        Comment(
            id: id ?? this.id,
            userId: userId ?? this.userId,
            comment: comment ?? this.comment,
            postId: postId ?? this.postId,
            parentCommentId: parentCommentId ?? this.parentCommentId,
            refType: refType ?? this.refType,
        );

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        userId: json["user_id"],
        comment: json["comment"],
        postId: json["post_id"],
        parentCommentId: json["parent_comment_id"],
        refType: json["ref_type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "comment": comment,
        "post_id": postId,
        "parent_comment_id": parentCommentId,
        "ref_type": refType,
    };
}
