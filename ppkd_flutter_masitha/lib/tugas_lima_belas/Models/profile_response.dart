// To parse this JSON data, do
//
//     final profileUserModel = profileUserModelFromJson(jsonString);

import 'dart:convert';

ProfileUserModel profileUserModelFromJson(String str) =>
    ProfileUserModel.fromJson(json.decode(str));

String profileUserModelToJson(ProfileUserModel data) =>
    json.encode(data.toJson());

class ProfileUserModel {
  String message;
  Data data;

  ProfileUserModel({required this.message, required this.data});

  factory ProfileUserModel.fromJson(Map<String, dynamic> json) =>
      ProfileUserModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {"message": message, "data": data.toJson()};
}

class Data {
  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;

  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
