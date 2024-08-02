// To parse this JSON data, do
//
//     final options = optionsFromJson(jsonString);

import 'dart:convert';

import 'package:recenth_posts/src/view/app/posts/components/polls/models/poll_vote.dart';

PollOption optionsFromJson(String str) => PollOption.fromJson(json.decode(str));

String optionsToJson(PollOption data) => json.encode(data.toJson());

class PollOption {
  int? id;
  int? pollId;
  String? optionValue;
  DateTime? createdAt;
  DateTime? updatedAt;

  List<PollVote>? pollVotes;

  PollOption({
    this.id,
    this.pollId,
    this.optionValue,
    this.pollVotes,
    this.createdAt,
    this.updatedAt,
  });

  PollOption copyWith({
    int? id,
    int? pollId,
    String? optionValue,
    List<PollVote>? pollVotes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      PollOption(
        id: id ?? this.id,
        pollId: pollId ?? this.pollId,
        optionValue: optionValue ?? this.optionValue,
        pollVotes: pollVotes ?? this.pollVotes,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory PollOption.fromJson(Map<String, dynamic> json) => PollOption(
        id: json["id"],
        pollId: json["poll_id"],
        optionValue: json["option_value"],
        pollVotes: (json['votes'] as List<dynamic>?)
            ?.map((e) => PollVote.fromJson(e as Map<String, dynamic>))
            .toList(),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "poll_id": pollId,
        "option_value": optionValue,
        "votes": List<PollVote>.from(pollVotes!.map((x) => x)),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
