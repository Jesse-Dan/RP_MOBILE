// To parse this JSON data, do
//
//     final pollVotePayload = pollVotePayloadFromJson(jsonString);

import 'dart:convert';

PollVotePayload pollVotePayloadFromJson(String str) => PollVotePayload.fromJson(json.decode(str));

String pollVotePayloadToJson(PollVotePayload data) => json.encode(data.toJson());

class PollVotePayload {
  int pollOptionId;

  PollVotePayload({
    required this.pollOptionId,
  });

  PollVotePayload copyWith({
    int? pollOptionId,
  }) =>
      PollVotePayload(
        pollOptionId: pollOptionId ?? this.pollOptionId,
      );

  factory PollVotePayload.fromJson(Map<String, dynamic> json) => PollVotePayload(
    pollOptionId: json["poll_option_id"],
  );

  Map<String, dynamic> toJson() => {
    "poll_option_id": pollOptionId,
  };
}
