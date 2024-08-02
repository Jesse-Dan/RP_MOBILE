// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      pollQuestion: json['poll_question'] as String?,
      state: json['state'] as String?,
      city: json['city'] as String?,
      device: json['device'] as String?,
      expiresAt: json['expires_at'] == null
          ? null
          : DateTime.parse(json['expires_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
      stars: (json['stars'] as List<dynamic>?)
          ?.map((e) => Star.fromJson(e as Map<String, dynamic>))
          .toList(),
      views: (json['views'] as List<dynamic>?)
          ?.map((e) => View.fromJson(e as Map<String, dynamic>))
          .toList(),
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => PollOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      votes: (json['votes'] as List<dynamic>?)
          ?.map((e) => PollVote.fromJson(e as Map<String, dynamic>))
          .toList(),
      subject: json['subject'] as String?,
      content: json['content'] as String?,
      link: json['link'],
    )..postType = json['post_type'] as String?;

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'poll_question': instance.pollQuestion,
      'state': instance.state,
      'city': instance.city,
      'post_type': instance.postType,
      'device': instance.device,
      'expires_at': instance.expiresAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'comments': instance.comments,
      'stars': instance.stars,
      'views': instance.views,
      'options': instance.options,
      'user': instance.user,
      'votes': instance.votes,
      'subject': instance.subject,
      'content': instance.content,
      'link': instance.link,
    };
