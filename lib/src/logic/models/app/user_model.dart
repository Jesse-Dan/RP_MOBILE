// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import '../../../utils/constants/global_constants.dart';
import '../../services/location_service/local_storage_service.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int? id;
  String? name;
  String? firstName;
  String? lastName;
  String? email;
  String? country;
  String? ipAddress;
  dynamic media;
  String? accountType;
  int? activeStatus;
  dynamic state;
  DateTime? emailVerifiedAt;
  dynamic rememberToken;
  String? fcm;
  int? deleted;
  dynamic deletedAt;
  String? phoneNumber;
  List<Login>? logins;
  List<dynamic>? locations;
  List<dynamic>? passwords;
  List<Asset>? assets;
  List<dynamic>? devices;

  User({
    this.id,
    this.name,
    this.firstName,
    this.lastName,
    this.email,
    this.country,
    this.ipAddress,
    this.media,
    this.accountType,
    this.activeStatus,
    this.state,
    this.emailVerifiedAt,
    this.rememberToken,
    this.fcm,
    this.deleted,
    this.deletedAt,
    this.phoneNumber,
    this.logins,
    this.locations,
    this.passwords,
    this.assets,
    this.devices,
  });

  User copyWith({
    int? id,
    String? name,
    String? firstName,
    String? lastName,
    String? email,
    String? country,
    String? ipAddress,
    dynamic media,
    String? accountType,
    int? activeStatus,
    dynamic state,
    DateTime? emailVerifiedAt,
    dynamic rememberToken,
    String? fcm,
    int? deleted,
    dynamic deletedAt,
    String? phoneNumber,
    List<Login>? logins,
    List<dynamic>? locations,
    List<dynamic>? passwords,
    List<Asset>? assets,
    List<dynamic>? devices,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        country: country ?? this.country,
        ipAddress: ipAddress ?? this.ipAddress,
        media: media ?? this.media,
        accountType: accountType ?? this.accountType,
        activeStatus: activeStatus ?? this.activeStatus,
        state: state ?? this.state,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        rememberToken: rememberToken ?? this.rememberToken,
        fcm: fcm ?? this.fcm,
        deleted: deleted ?? this.deleted,
        deletedAt: deletedAt ?? this.deletedAt,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        logins: logins ?? this.logins,
        locations: locations ?? this.locations,
        passwords: passwords ?? this.passwords,
        assets: assets ?? this.assets,
        devices: devices ?? this.devices,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        country: json["country"],
        ipAddress: json["ip_address"],
        media: json["media"],
        accountType: json["account_type"],
        activeStatus: json["active_status"],
        state: json["state"],
        emailVerifiedAt: json["email_verified_at"] == null
            ? null
            : DateTime.parse(json["email_verified_at"]),
        rememberToken: json["remember_token"],
        fcm: json["fcm"],
        deleted: json["deleted"],
        deletedAt: json["deleted_at"],
        phoneNumber: json["phone_number"],
        logins: json["logins"] == null
            ? []
            : List<Login>.from(json["logins"]!.map((x) => Login.fromJson(x))),
        locations: json["locations"] == null
            ? []
            : List<dynamic>.from(json["locations"]!.map((x) => x)),
        passwords: json["passwords"] == null
            ? []
            : List<dynamic>.from(json["passwords"]!.map((x) => x)),
        assets: json["assets"] == null
            ? []
            : List<Asset>.from(json["assets"]!.map((x) => Asset.fromJson(x))),
        devices: json["devices"] == null
            ? []
            : List<dynamic>.from(json["devices"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "country": country,
        "ip_address": ipAddress,
        "media": media,
        "account_type": accountType,
        "active_status": activeStatus,
        "state": state,
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "remember_token": rememberToken,
        "fcm": fcm,
        "deleted": deleted,
        "deleted_at": deletedAt,
        "phone_number": phoneNumber,
        "logins": logins == null
            ? []
            : List<dynamic>.from(logins!.map((x) => x.toJson())),
        "locations": locations == null
            ? []
            : List<dynamic>.from(locations!.map((x) => x)),
        "passwords": passwords == null
            ? []
            : List<dynamic>.from(passwords!.map((x) => x)),
        "assets": assets == null
            ? []
            : List<dynamic>.from(assets!.map((x) => x.toJson())),
        "devices":
            devices == null ? [] : List<dynamic>.from(devices!.map((x) => x)),
      };

  static User getPresentUser() => User.fromJson(
      json.decode(LocalStorageService.getString(GlobalConstants.USER)));
}

class Asset {
  int? id;
  int? userId;
  String? assetType;
  String? path;
  dynamic size;
  String? mimeType;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? deleted;
  dynamic deletedAt;
  String? groupId;

  Asset({
    this.id,
    this.userId,
    this.assetType,
    this.path,
    this.size,
    this.mimeType,
    this.createdAt,
    this.updatedAt,
    this.deleted,
    this.deletedAt,
    this.groupId,
  });

  Asset copyWith({
    int? id,
    int? userId,
    String? assetType,
    String? path,
    dynamic size,
    String? mimeType,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? deleted,
    dynamic deletedAt,
    String? groupId,
  }) =>
      Asset(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        assetType: assetType ?? this.assetType,
        path: path ?? this.path,
        size: size ?? this.size,
        mimeType: mimeType ?? this.mimeType,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deleted: deleted ?? this.deleted,
        deletedAt: deletedAt ?? this.deletedAt,
        groupId: groupId ?? this.groupId,
      );

  factory Asset.fromJson(Map<String, dynamic> json) => Asset(
        id: json["id"],
        userId: json["user_id"],
        assetType: json["asset_type"],
        path: json["path"],
        size: json["size"],
        mimeType: json["mime_type"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deleted: json["deleted"],
        deletedAt: json["deleted_at"],
        groupId: json["group_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "asset_type": assetType,
        "path": path,
        "size": size,
        "mime_type": mimeType,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted": deleted,
        "deleted_at": deletedAt,
        "group_id": groupId,
      };
}

class Login {
  int? id;
  int? userId;
  DateTime? loggedInAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  Login({
    this.id,
    this.userId,
    this.loggedInAt,
    this.createdAt,
    this.updatedAt,
  });

  Login copyWith({
    int? id,
    int? userId,
    DateTime? loggedInAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Login(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        loggedInAt: loggedInAt ?? this.loggedInAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        id: json["id"],
        userId: json["user_id"],
        loggedInAt: json["logged_in_at"] == null
            ? null
            : DateTime.parse(json["logged_in_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "logged_in_at": loggedInAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };

}
