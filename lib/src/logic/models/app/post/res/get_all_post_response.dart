// To parse this JSON data, do
//
//     final postResponse = postResponseFromJson(jsonString);

import 'dart:convert';

PostResponse postResponseFromJson(String str) => PostResponse.fromJson(json.decode(str));

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
        data: json["data"] == null ? [] : List<Post>.from(json["data"]!.map((x) => Post.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "statusCode": statusCode,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Post {
    final int? id;
    final int? userId;
    final String? subject;
    final String? content;
    final String? file;
    final User? user;
    final Category? category;

    Post({
        this.id,
        this.userId,
        this.subject,
        this.content,
        this.file,
        this.user,
        this.category,
    });

    Post copyWith({
        int? id,
        int? userId,
        String? subject,
        String? content,
        String? file,
        User? user,
        Category? category,
    }) => 
        Post(
            id: id ?? this.id,
            userId: userId ?? this.userId,
            subject: subject ?? this.subject,
            content: content ?? this.content,
            file: file ?? this.file,
            user: user ?? this.user,
            category: category ?? this.category,
        );

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        userId: json["user_id"],
        subject: json["subject"],
        content: json["content"],
        file: json["file"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "subject": subject,
        "content": content,
        "file": file,
        "user": user?.toJson(),
        "category": category?.toJson(),
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
        subCategory: json["sub_category"] == null ? null : SubCategory.fromJson(json["sub_category"]),
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

class User {
    final int? id;
    final String? firstName;
    final String? lastName;
    final String? email;
    final String? password;
    final String? confirmPassword;
    final String? secreatKey;
    final dynamic country;

    User({
        this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.password,
        this.confirmPassword,
        this.secreatKey,
        this.country,
    });

    User copyWith({
        int? id,
        String? firstName,
        String? lastName,
        String? email,
        String? password,
        String? confirmPassword,
        String? secreatKey,
        dynamic country,
    }) => 
        User(
            id: id ?? this.id,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            email: email ?? this.email,
            password: password ?? this.password,
            confirmPassword: confirmPassword ?? this.confirmPassword,
            secreatKey: secreatKey ?? this.secreatKey,
            country: country ?? this.country,
        );

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        password: json["password"],
        confirmPassword: json["confirm_password"],
        secreatKey: json["secreat_key"],
        country: json["country"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "password": password,
        "confirm_password": confirmPassword,
        "secreat_key": secreatKey,
        "country": country,
    };
}
