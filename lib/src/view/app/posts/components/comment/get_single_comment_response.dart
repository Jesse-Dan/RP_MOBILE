// To parse this JSON data, do
//
//     final getCommentResponse = getCommentResponseFromJson(jsonString);


import 'dart:convert';

import 'model/comment.dart';

GetCommentResponse getCommentResponseFromJson(String str) => GetCommentResponse.fromJson(json.decode(str));

String getCommentResponseToJson(GetCommentResponse data) => json.encode(data.toJson());

class GetCommentResponse {
  bool status;
  int statusCode;
  String message;
  List<Comment> data;

  GetCommentResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  GetCommentResponse copyWith({
    bool? status,
    int? statusCode,
    String? message,
    List<Comment>? data,
  }) =>
      GetCommentResponse(
        status: status ?? this.status,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory GetCommentResponse.fromJson(Map<String, dynamic> json) => GetCommentResponse(
    status: json["status"],
    statusCode: json["statusCode"],
    message: json["message"],
    data: List<Comment>.from(json["data"].map((x) => Comment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "statusCode": statusCode,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}
