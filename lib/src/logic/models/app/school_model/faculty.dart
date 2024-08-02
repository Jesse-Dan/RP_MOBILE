// To parse this JSON data, do
//
//     final faculty = facultyFromJson(jsonString);

import 'dart:convert';

import 'department.dart';

Faculty facultyFromJson(String str) => Faculty.fromJson(json.decode(str));

String facultyToJson(Faculty data) => json.encode(data.toJson());

class Faculty {
  int? id;
  String? name;
  dynamic createdAt;
  dynamic updatedAt;
  List<Department>? departments;

  Faculty({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.departments,
  });

  Faculty copyWith({
    int? id,
    String? name,
    dynamic createdAt,
    dynamic updatedAt,
    List<Department>? departments,
  }) =>
      Faculty(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        departments: departments ?? this.departments,
      );

  factory Faculty.fromJson(Map<String, dynamic> json) => Faculty(
    id: json["id"],
    name: json["name"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    departments:json["departments"] == null?[]: List<Department>.from(json["departments"].map((x) => Department.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "departments": List<dynamic>.from(departments!.map((x) => x.toJson())),
  };
}
