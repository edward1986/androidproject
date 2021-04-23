// To parse this JSON data, do
//
//     final companyModel = companyModelFromJson(jsonString);

import 'dart:convert';

CompanyModel companyModelFromJson(String str) =>
    CompanyModel.fromJson(json.decode(str));

String companyModelToJson(CompanyModel data) => json.encode(data.toJson());

class CompanyModel {
  CompanyModel({
    this.id,
    this.name,
    this.email,
    this.created_at
  });

  String id;
  String name;
  String email;
  String created_at;

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        id: json["id"].toString(),
        name: json["name"],
        email: json["email"],
        created_at: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "created_at": created_at,
      };
}
