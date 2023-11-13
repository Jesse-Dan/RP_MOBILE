// To parse this JSON data, do
//
//     final regResponse = regResponseFromJson(jsonString);

import 'dart:convert';

RegResponse regResponseFromJson(String str) => RegResponse.fromJson(json.decode(str));

String regResponseToJson(RegResponse data) => json.encode(data.toJson());

class RegResponse {
    final String? firstName;
    final String? lastName;
    final String? email;
    final int? id;

    RegResponse({
        this.firstName,
        this.lastName,
        this.email,
        this.id,
    });

    RegResponse copyWith({
        String? firstName,
        String? lastName,
        String? email,
        int? id,
    }) => 
        RegResponse(
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            email: email ?? this.email,
            id: id ?? this.id,
        );

    factory RegResponse.fromJson(Map<String, dynamic> json) => RegResponse(
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "id": id,
    };
}
