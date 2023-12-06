// To parse this JSON data, do
//
//     final postResponse = postResponseFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:recenth_posts/src/logic/models/app/post/res/comment_response.dart';

PostResponse postResponseFromJson(String str) =>
    PostResponse.fromJson(json.decode(str));

String postResponseToJson(PostResponse data) => json.encode(data.toJson());

class PostResponse {
  final bool? status;
  final int? statusCode;
  final String? message;
  final List<Post>? data;

  PostResponse({
    this.status,
    this.statusCode,
    this.message,
    this.data,
  });

  PostResponse copyWith({
    bool? status,
    int? statusCode,
    String? message,
    List<Post>? data,
  }) =>
      PostResponse(
        status: status ?? this.status,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory PostResponse.fromJson(Map<String, dynamic> json) => PostResponse(
        status: json["status"],
        statusCode: json["statusCode"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Post>.from(json["data"]!.map((x) => Post.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "statusCode": statusCode,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  final int? id;
  final String? category;
  final dynamic subCategory;
  final String? postTime;
  final User? user;
  final String? subject;
  final String? content;
  final List<HashTag>? hashTags;
  final List<String>? images;

  Post({
    this.id,
    this.category,
    this.subCategory,
    this.postTime,
    this.user,
    this.subject,
    this.content,
    this.hashTags,
    this.images,
  });

  Post copyWith({
    int? id,
    String? category,
    dynamic subCategory,
    String? postTime,
    User? user,
    String? subject,
    String? content,
    List<HashTag>? hashTags,
    List<String>? images,
  }) =>
      Post(
        id: id ?? this.id,
        category: category ?? this.category,
        subCategory: subCategory ?? this.subCategory,
        postTime: postTime ?? this.postTime,
        user: user ?? this.user,
        subject: subject ?? this.subject,
        content: content ?? this.content,
        hashTags: hashTags ?? this.hashTags,
        images: images ?? this.images,
      );

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        category: json["category"],
        subCategory: json["sub-category"],
        postTime: json["post-time"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        subject: json["subject"],
        content: json["content"],
        hashTags: json["hash-tags"] == null
            ? []
            : List<HashTag>.from(
                json["hash-tags"]!.map((x) => hashTagValues.map[x]!)),
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "sub-category": subCategory,
        "post-time": postTime,
        "user": user?.toJson(),
        "subject": subject,
        "content": content,
        "hash-tags": hashTags == null
            ? []
            : List<dynamic>.from(
                hashTags!.map((x) => hashTagValues.reverse[x])),
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
      };
}
enum HashTag { CORRUPT, ELECTION, GOVERNMENT, PEOPLE, LOVE, TECHNOLOGY }

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

final hashTagValues = EnumValues({
  "Corrupt": HashTag.CORRUPT,
  "Election": HashTag.ELECTION,
  "Government": HashTag.GOVERNMENT,
  "People": HashTag.PEOPLE,
  "Love": HashTag.LOVE,
  "Technology": HashTag.TECHNOLOGY,
});

class User {
  final int? id;
  final String? name;
  final String? userId;

  User({
    this.id,
    this.name,
    this.userId,
  });

  User copyWith({
    int? id,
    String? name,
    String? userId,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        userId: userId ?? this.userId,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        userId: json["user-id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "user-id": userId,
      };
}
