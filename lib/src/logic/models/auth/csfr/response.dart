// To parse this JSON data, do
//
//     final csfrResponse = csfrResponseFromJson(jsonString);

import 'dart:convert';

CsfrResponse csfrResponseFromJson(String str) => CsfrResponse.fromJson(json.decode(str));

String csfrResponseToJson(CsfrResponse data) => json.encode(data.toJson());

class CsfrResponse {
    final String? csrfToken;

    CsfrResponse({
        this.csrfToken,
    });

    CsfrResponse copyWith({
        String? csrfToken,
    }) => 
        CsfrResponse(
            csrfToken: csrfToken ?? this.csrfToken,
        );

    factory CsfrResponse.fromJson(Map<String, dynamic> json) => CsfrResponse(
        csrfToken: json["CSRF-TOKEN"],
    );

    Map<String, dynamic> toJson() => {
        "CSRF-TOKEN": csrfToken,
    };
}
