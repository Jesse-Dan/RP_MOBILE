// To parse this JSON data, do
//
//     final pollVote = pollVoteFromJson(jsonString);

import 'dart:convert';

PollVote pollVoteFromJson(String str) => PollVote.fromJson(json.decode(str));

String pollVoteToJson(PollVote data) => json.encode(data.toJson());

class PollVote {
  int? id;
  int? userId;
  int? pollOptionId;
  DateTime? createdAt;
  DateTime? updatedAt;

  PollVote({
     this.id,
     this.userId,
     this.pollOptionId,
     this.createdAt,
     this.updatedAt,
  });

  PollVote copyWith({
    int? id,
    int? userId,
    int? pollOptionId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      PollVote(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        pollOptionId: pollOptionId ?? this.pollOptionId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory PollVote.fromJson(Map<String, dynamic> json) => PollVote(
        id: json["id"],
        userId: json["user_id"],
        pollOptionId: json["poll_option_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "poll_option_id": pollOptionId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
