// To parse this JSON data, do
//
//     final postResponse = postResponseFromJson(jsonString);

import 'dart:io';

class PostResponse {
  final int? id;
  final int? userId;
  final String? subject;
  final String? content;
  final File? file;
  final User? user;
  final Category? category;
  final List<Comment>? comments;
  final List<View>? views;

  PostResponse({
    this.id,
    this.userId,
    this.subject,
    this.content,
    this.file,
    this.user,
    this.category,
    this.comments,
    this.views,
  });

  PostResponse copyWith({
    int? id,
    int? userId,
    String? subject,
    String? content,
    File? file,
    User? user,
    Category? category,
    List<Comment>? comments,
    List<View>? views,
  }) =>
      PostResponse(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        subject: subject ?? this.subject,
        content: content ?? this.content,
        file: file ?? this.file,
        user: user ?? this.user,
        category: category ?? this.category,
        comments: comments ?? this.comments,
        views: views ?? this.views,
      );

  factory PostResponse.fromJson(Map<String, dynamic> json) => PostResponse(
        id: json["id"],
        userId: json["user_id"],
        subject: json["subject"],
        content: json["content"],
        file: File(json["file"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        comments: json["comments"] == null
            ? []
            : List<Comment>.from(
                json["comments"]!.map((x) => Comment.fromJson(x))),
        views: json["views"] == null
            ? []
            : List<View>.from(json["views"]!.map((x) => View.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "subject": subject,
        "content": content,
        "file": file?.path,
        "user": user?.toJson(),
        "category": category?.toJson(),
        "comments": comments == null
            ? []
            : List<dynamic>.from(comments!.map((x) => x.toJson())),
        "views": views == null
            ? []
            : List<dynamic>.from(views!.map((x) => x.toJson())),
      };
}

class Category {
  final int? id;
  final String? name;
  final SubCategory? subCategory;
  final dynamic subCategoryChild;

  Category({
    this.id,
    this.name,
    this.subCategory,
    this.subCategoryChild,
  });

  Category copyWith({
    int? id,
    String? name,
    SubCategory? subCategory,
    dynamic subCategoryChild,
  }) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        subCategory: subCategory ?? this.subCategory,
        subCategoryChild: subCategoryChild ?? this.subCategoryChild,
      );

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        subCategory: json["sub_category"] == null
            ? null
            : SubCategory.fromJson(json["sub_category"]),
        subCategoryChild: json["sub_category_child"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sub_category": subCategory?.toJson(),
        "sub_category_child": subCategoryChild,
      };
}

class SubCategory {
  final int? id;
  final String? name;
  final int? categoryId;

  SubCategory({
    this.id,
    this.name,
    this.categoryId,
  });

  SubCategory copyWith({
    int? id,
    String? name,
    int? categoryId,
  }) =>
      SubCategory(
        id: id ?? this.id,
        name: name ?? this.name,
        categoryId: categoryId ?? this.categoryId,
      );

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json["id"],
        name: json["name"],
        categoryId: json["category_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category_id": categoryId,
      };
}

class Comment {
  final int? id;
  final int? userId;
  final String? comment;
  final int? postId;
  final int? parentCommentId;
  final int? refType;
  final List<Comment>? replies;
  final List<Reaction>? reaction;

  Comment({
    this.id,
    this.userId,
    this.comment,
    this.postId,
    this.parentCommentId,
    this.refType,
    this.replies,
    this.reaction,
  });

  Comment copyWith({
    int? id,
    int? userId,
    String? comment,
    int? postId,
    int? parentCommentId,
    int? refType,
    List<Comment>? replies,
    List<Reaction>? reaction,
  }) =>
      Comment(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        comment: comment ?? this.comment,
        postId: postId ?? this.postId,
        parentCommentId: parentCommentId ?? this.parentCommentId,
        refType: refType ?? this.refType,
        replies: replies ?? this.replies,
        reaction: reaction ?? this.reaction,
      );

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        userId: json["user_id"],
        comment: json["comment"],
        postId: json["post_id"],
        parentCommentId: json["parent_comment_id"],
        refType: json["ref_type"],
        replies: json["replies"] == null
            ? []
            : List<Comment>.from(
                json["replies"]!.map((x) => Comment.fromJson(x))),
        reaction: json["reaction"] == null
            ? []
            : List<Reaction>.from(
                json["reaction"]!.map((x) => Reaction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "comment": comment,
        "post_id": postId,
        "parent_comment_id": parentCommentId,
        "ref_type": refType,
        "replies": replies == null
            ? []
            : List<dynamic>.from(replies!.map((x) => x.toJson())),
        "reaction": reaction == null
            ? []
            : List<dynamic>.from(reaction!.map((x) => x.toJson())),
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

class User {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
  });

  User copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
  }) =>
      User(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
      };
}

class View {
  final int? id;
  final int? userId;
  final int? refId;

  View({
    this.id,
    this.userId,
    this.refId,
  });

  View copyWith({
    int? id,
    int? userId,
    int? refId,
  }) =>
      View(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        refId: refId ?? this.refId,
      );

  factory View.fromJson(Map<String, dynamic> json) => View(
        id: json["id"],
        userId: json["user_id"],
        refId: json["ref_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "ref_id": refId,
      };
}
