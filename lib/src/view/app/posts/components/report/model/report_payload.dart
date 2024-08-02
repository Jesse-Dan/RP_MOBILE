// To parse this JSON data, do
//
//     final reportPayload = reportPayloadFromJson(jsonString);

import 'dart:convert';

ReportPayload reportPayloadFromJson(String str) => ReportPayload.fromJson(json.decode(str));

String reportPayloadToJson(ReportPayload data) => json.encode(data.toJson());

class ReportPayload {
  int userId;
  int refId;
  String refName;
  String reportType;
  String reportSummary;
  int reportedUserId;

  ReportPayload({
    required this.userId,
    required this.refId,
    required this.refName,
    required this.reportType,
    required this.reportSummary,
    required this.reportedUserId,
  });

  ReportPayload copyWith({
    int? userId,
    int? refId,
    String? refName,
    String? reportType,
    String? reportSummary,
    int? reportedUserId,
  }) =>
      ReportPayload(
        userId: userId ?? this.userId,
        refId: refId ?? this.refId,
        refName: refName ?? this.refName,
        reportType: reportType ?? this.reportType,
        reportSummary: reportSummary ?? this.reportSummary,
        reportedUserId: reportedUserId ?? this.reportedUserId,
      );

  factory ReportPayload.fromJson(Map<String, dynamic> json) => ReportPayload(
    userId: json["user_id"],
    refId: json["ref_id"],
    refName: json["ref_name"],
    reportType: json["report_type"],
    reportSummary: json["report_summary"],
    reportedUserId: json["reported_user_id"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "ref_id": refId,
    "ref_name": refName,
    "report_type": reportType,
    "report_summary": reportSummary,
    "reported_user_id": reportedUserId,
  };
}
