// To parse this JSON data, do
//
//     final reactionResponse = reactionResponseFromJson(jsonString);

import 'dart:convert';

ReactionResponse reactionResponseFromJson(String str) => ReactionResponse.fromJson(json.decode(str));

String reactionResponseToJson(ReactionResponse data) => json.encode(data.toJson());

class ReactionResponse {
    final bool? status;
    final int? statusCode;
    final String? message;
    final List<Reaction>? data;

    ReactionResponse({
        this.status,
        this.statusCode,
        this.message,
        this.data,
    });

    ReactionResponse copyWith({
        bool? status,
        int? statusCode,
        String? message,
        List<Reaction>? data,
    }) => 
        ReactionResponse(
            status: status ?? this.status,
            statusCode: statusCode ?? this.statusCode,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory ReactionResponse.fromJson(Map<String, dynamic> json) => ReactionResponse(
        status: json["status"],
        statusCode: json["statusCode"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Reaction>.from(json["data"]!.map((x) => Reaction.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "statusCode": statusCode,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Reaction {
    final int? id;
    final int? userId;
    final int? reactId;
    final dynamic postId;
    final int? parentCommentId;
    final int? refType;

    Reaction({
        this.id,
        this.userId,
        this.reactId,
        this.postId,
        this.parentCommentId,
        this.refType,
    });

    Reaction copyWith({
        int? id,
        int? userId,
        int? reactId,
        dynamic postId,
        int? parentCommentId,
        int? refType,
    }) => 
        Reaction(
            id: id ?? this.id,
            userId: userId ?? this.userId,
            reactId: reactId ?? this.reactId,
            postId: postId ?? this.postId,
            parentCommentId: parentCommentId ?? this.parentCommentId,
            refType: refType ?? this.refType,
        );

    factory Reaction.fromJson(Map<String, dynamic> json) => Reaction(
        id: json["id"],
        userId: json["user_id"],
        reactId: json["react_id"],
        postId: json["post_id"],
        parentCommentId: json["parent_comment_id"],
        refType: json["ref_type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "react_id": reactId,
        "post_id": postId,
        "parent_comment_id": parentCommentId,
        "ref_type": refType,
    };
}
