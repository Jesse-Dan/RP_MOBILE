// To parse this JSON data, do
//
//     final blockedUserPayload = blockedUserPayloadFromJson(jsonString);

import 'dart:convert';

BlockedPayload blockedUserPayloadFromJson(String str) => BlockedPayload.fromJson(json.decode(str));

String blockedUserPayloadToJson(BlockedPayload data) => json.encode(data.toJson());

class BlockedPayload {
  int userId;
  int refId;
  String refName;
  String blockedUserType;
  String blockedUserSummary;
  int blockedUseredUserId;

  BlockedPayload({
    required this.userId,
    required this.refId,
    required this.refName,
    required this.blockedUserType,
    required this.blockedUserSummary,
    required this.blockedUseredUserId,
  });

  BlockedPayload copyWith({
    int? userId,
    int? refId,
    String? refName,
    String? blockedUserType,
    String? blockedUserSummary,
    int? blockedUseredUserId,
  }) =>
      BlockedPayload(
        userId: userId ?? this.userId,
        refId: refId ?? this.refId,
        refName: refName ?? this.refName,
        blockedUserType: blockedUserType ?? this.blockedUserType,
        blockedUserSummary: blockedUserSummary ?? this.blockedUserSummary,
        blockedUseredUserId: blockedUseredUserId ?? this.blockedUseredUserId,
      );

  factory BlockedPayload.fromJson(Map<String, dynamic> json) => BlockedPayload(
    userId: json["user_id"],
    refId: json["ref_id"],
    refName: json["ref_name"],
    blockedUserType: json["blockedUser_type"],
    blockedUserSummary: json["blockedUser_summary"],
    blockedUseredUserId: json["blockedUsered_user_id"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "ref_id": refId,
    "ref_name": refName,
    "blockedUser_type": blockedUserType,
    "blockedUser_summary": blockedUserSummary,
    "blockedUsered_user_id": blockedUseredUserId,
  };
}
