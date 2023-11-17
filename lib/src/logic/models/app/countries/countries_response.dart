// To parse this JSON data, do
//
//     final countriesResponse = countriesResponseFromJson(jsonString);

import 'dart:convert';

CountriesResponse countriesResponseFromJson(String str) => CountriesResponse.fromJson(json.decode(str));

String countriesResponseToJson(CountriesResponse data) => json.encode(data.toJson());

class CountriesResponse {
    final bool? status;
    final int? statusCode;
    final String? message;
    final List<Country>? data;

    CountriesResponse({
        this.status,
        this.statusCode,
        this.message,
        this.data,
    });

    CountriesResponse copyWith({
        bool? status,
        int? statusCode,
        String? message,
        List<Country>? data,
    }) => 
        CountriesResponse(
            status: status ?? this.status,
            statusCode: statusCode ?? this.statusCode,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory CountriesResponse.fromJson(Map<String, dynamic> json) => CountriesResponse(
        status: json["status"],
        statusCode: json["statusCode"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Country>.from(json["data"]!.map((x) => Country.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "statusCode": statusCode,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Country {
    final int? id;
    final String? code;
    final String? name;
    final int? phoneCode;
    final String? flag;

    Country({
        this.id,
        this.code,
        this.name,
        this.phoneCode,
        this.flag,
    });

    Country copyWith({
        int? id,
        String? code,
        String? name,
        int? phoneCode,
        String? flag,
    }) => 
        Country(
            id: id ?? this.id,
            code: code ?? this.code,
            name: name ?? this.name,
            phoneCode: phoneCode ?? this.phoneCode,
            flag: flag ?? this.flag,
        );

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        code: json["code"],
        name: json["name"],
        phoneCode: json["phone_code"],
        flag: json["flag"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
        "phone_code": phoneCode,
        "flag": flag,
    };
}
