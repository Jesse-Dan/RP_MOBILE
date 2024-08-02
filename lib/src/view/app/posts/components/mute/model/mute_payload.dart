// To parse this JSON data, do
//
//     final mutePayload = mutePayloadFromJson(jsonString);

import 'dart:convert';

MutePayload mutePayloadFromJson(String str) => MutePayload.fromJson(json.decode(str));

String mutePayloadToJson(MutePayload data) => json.encode(data.toJson());

class MutePayload {
  int userId;
  int refId;
  String refName;
  String muteType;
  String muteSummary;
  int muteedUserId;

  MutePayload({
    required this.userId,
    required this.refId,
    required this.refName,
    required this.muteType,
    required this.muteSummary,
    required this.muteedUserId,
  });

  MutePayload copyWith({
    int? userId,
    int? refId,
    String? refName,
    String? muteType,
    String? muteSummary,
    int? muteedUserId,
  }) =>
      MutePayload(
        userId: userId ?? this.userId,
        refId: refId ?? this.refId,
        refName: refName ?? this.refName,
        muteType: muteType ?? this.muteType,
        muteSummary: muteSummary ?? this.muteSummary,
        muteedUserId: muteedUserId ?? this.muteedUserId,
      );

  factory MutePayload.fromJson(Map<String, dynamic> json) => MutePayload(
    userId: json["user_id"],
    refId: json["ref_id"],
    refName: json["ref_name"],
    muteType: json["mute_type"],
    muteSummary: json["mute_summary"],
    muteedUserId: json["muteed_user_id"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "ref_id": refId,
    "ref_name": refName,
    "mute_type": muteType,
    "mute_summary": muteSummary,
    "muteed_user_id": muteedUserId,
  };
}
