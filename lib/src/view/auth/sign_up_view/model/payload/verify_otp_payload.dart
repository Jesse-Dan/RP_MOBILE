// To parse this JSON data, do
//
//     final verifyOtpPayload = verifyOtpPayloadFromJson(jsonString);

import 'dart:convert';

VerifyOtpPayload verifyOtpPayloadFromJson(String str) =>
    VerifyOtpPayload.fromJson(json.decode(str));

String verifyOtpPayloadToJson(VerifyOtpPayload data) =>
    json.encode(data.toJson());

class VerifyOtpPayload {
  String otp;

  VerifyOtpPayload({
    required this.otp,
  });

  VerifyOtpPayload copyWith({
    String? otp,
  }) =>
      VerifyOtpPayload(
        otp: otp ?? this.otp,
      );

  factory VerifyOtpPayload.fromJson(Map<String, dynamic> json) =>
      VerifyOtpPayload(
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "otp": otp,
      };
}
