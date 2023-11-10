import 'dart:convert';

T baseResponseFromJson<T>(String str, T Function(Map<String, dynamic>) fromJson) {
  return fromJson(json.decode(str));
}

String baseResponseToJson<T>(T data) {
  return json.encode(data);
}

class BaseResponse<T> {
  final bool? status;
  final int? statusCode;
  final String? message;
  final List<T>? data;

   BaseResponse({
    this.status = true,
    this.statusCode = 200,
    this.message = 'OK',
    this.data = null,
  });

  BaseResponse<T> copyWith({
    bool? status,
    int? statusCode,
    String? message,
    List<T>? data,
  }) =>
      BaseResponse(
        status: status ?? this.status,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory BaseResponse.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJson) {
    return BaseResponse<T>(
      status: json["status"],
      statusCode: json["statusCode"],
      message: json["message"],
      data: json["data"] == null
          ? []
          : List<T>.from(json["data"].map((x) => fromJson(x))),
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJson) => {
        "status": status,
        "statusCode": statusCode,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => toJson(x))),
      };
}
