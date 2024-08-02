// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final postResponse = postResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

import 'post_model.dart';

part 'post_response_model.g.dart';

@JsonSerializable()
class PostResponse {
  bool? status;
  int? statusCode;
  String? message;
  List<Post>? data;

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

      /// Connect the generated [_$PostResponseFromJson] function to the `fromJson`
  /// factory.
  factory PostResponse.fromJson(Map<String, dynamic> json) => _$PostResponseFromJson(json);

  /// Connect the generated [_$PostResponseToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PostResponseToJson(this);
}
