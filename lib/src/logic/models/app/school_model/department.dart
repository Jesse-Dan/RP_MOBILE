// To parse this JSON data, do
//
//     final department = departmentFromJson(jsonString);

import 'dart:convert';

Department departmentFromJson(String str) => Department.fromJson(json.decode(str));

String departmentToJson(Department data) => json.encode(data.toJson());

class Department {
  int? id;
  int? facultyId;
  String? department;
  DateTime? createdAt;
  DateTime? updatedAt;

  Department({
    required this.id,
    required this.facultyId,
    required this.department,
    required this.createdAt,
    required this.updatedAt,
  });

  Department copyWith({
    int? id,
    int? facultyId,
    String? department,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Department(
        id: id ?? this.id,
        facultyId: facultyId ?? this.facultyId,
        department: department ?? this.department,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Department.fromJson(Map<String, dynamic> json) => Department(
    id: json["id"],
    facultyId: json["faculty_id"],
    department: json["department"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "faculty_id": facultyId,
    "department": department,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
