// To parse this JSON data, do
//
//     final school = schoolFromJson(jsonString);

import 'dart:convert';

School schoolFromJson(String str) => School.fromJson(json.decode(str));

String schoolToJson(School data) => json.encode(data.toJson());

class School {
  int id;
  String? stateProvince;
  String? country;
  String? name;
  String? alphaTwoCode;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Domain?>? domains;
  List<Webpage?>? webpages;

  School({
    required this.id,
    required this.stateProvince,
    required this.country,
    required this.name,
    required this.alphaTwoCode,
    required this.createdAt,
    required this.updatedAt,
    required this.domains,
    required this.webpages,
  });

  School copyWith({
    int? id,
    String? stateProvince,
    String? country,
    String? name,
    String? alphaTwoCode,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<Domain>? domains,
    List<Webpage>? webpages,
  }) =>
      School(
        id: id ?? this.id,
        stateProvince: stateProvince ?? this.stateProvince,
        country: country ?? this.country,
        name: name ?? this.name,
        alphaTwoCode: alphaTwoCode ?? this.alphaTwoCode,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        domains: domains ?? this.domains,
        webpages: webpages ?? this.webpages,
      );

  factory School.fromJson(Map<String, dynamic> json) => School(
        id: json["id"],
        stateProvince: json["state_province"],
        country: json["country"],
        name: json["name"],
        alphaTwoCode: json["alpha_two_code"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        domains: json["domains"] != null
            ? List<Domain>.from(json["domains"].map((x) => Domain.fromJson(x)))
            : [],
        webpages: json["webpages"] != null
            ? List<Webpage>.from(
                json["webpages"].map((x) => Webpage.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "state_province": stateProvince,
        "country": country,
        "name": name,
        "alpha_two_code": alphaTwoCode,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "domains": domains != null
            ? List<dynamic>.from(domains!.map((x) => x?.toJson()))
            : [],
        "webpages": webpages != null
            ? List<dynamic>.from(webpages!.map((x) => x?.toJson()))
            : [],
      };
}

class Domain {
  int id;
  String domain;
  int universityId;
  DateTime createdAt;
  DateTime updatedAt;

  Domain({
    required this.id,
    required this.domain,
    required this.universityId,
    required this.createdAt,
    required this.updatedAt,
  });

  Domain copyWith({
    int? id,
    String? domain,
    int? universityId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Domain(
        id: id ?? this.id,
        domain: domain ?? this.domain,
        universityId: universityId ?? this.universityId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Domain.fromJson(Map<String, dynamic> json) => Domain(
        id: json["id"],
        domain: json["domain"],
        universityId: json["university_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "domain": domain,
        "university_id": universityId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Webpage {
  int id;
  int universityId;
  DateTime createdAt;
  DateTime updatedAt;
  String webPage;

  Webpage({
    required this.id,
    required this.universityId,
    required this.createdAt,
    required this.updatedAt,
    required this.webPage,
  });

  Webpage copyWith({
    int? id,
    int? universityId,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? webPage,
  }) =>
      Webpage(
        id: id ?? this.id,
        universityId: universityId ?? this.universityId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        webPage: webPage ?? this.webPage,
      );

  factory Webpage.fromJson(Map<String, dynamic> json) => Webpage(
        id: json["id"],
        universityId: json["university_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        webPage: json["web_page"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "university_id": universityId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "web_page": webPage,
      };
}
