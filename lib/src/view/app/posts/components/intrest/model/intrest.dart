// To parse this JSON data, do
//
//     final intrestPayload = intrestPayloadFromJson(jsonString);

import 'dart:convert';

IntrestPayload intrestPayloadFromJson(String str) => IntrestPayload.fromJson(json.decode(str));

String intrestPayloadToJson(IntrestPayload data) => json.encode(data.toJson());

class IntrestPayload {
  int userId;
  int refId;
  String refName;
  String intrestType;
  String intrestSummary;
  int intrestedUserId;

  IntrestPayload({
    required this.userId,
    required this.refId,
    required this.refName,
    required this.intrestType,
    required this.intrestSummary,
    required this.intrestedUserId,
  });

  IntrestPayload copyWith({
    int? userId,
    int? refId,
    String? refName,
    String? intrestType,
    String? intrestSummary,
    int? intrestedUserId,
  }) =>
      IntrestPayload(
        userId: userId ?? this.userId,
        refId: refId ?? this.refId,
        refName: refName ?? this.refName,
        intrestType: intrestType ?? this.intrestType,
        intrestSummary: intrestSummary ?? this.intrestSummary,
        intrestedUserId: intrestedUserId ?? this.intrestedUserId,
      );

  factory IntrestPayload.fromJson(Map<String, dynamic> json) => IntrestPayload(
    userId: json["user_id"],
    refId: json["ref_id"],
    refName: json["ref_name"],
    intrestType: json["intrest_type"],
    intrestSummary: json["intrest_summary"],
    intrestedUserId: json["intrested_user_id"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "ref_id": refId,
    "ref_name": refName,
    "intrest_type": intrestType,
    "intrest_summary": intrestSummary,
    "intrested_user_id": intrestedUserId,
  };
}
