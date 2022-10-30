import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  const UserModel({
    this.id,
    this.email,
    this.isActive,
    this.lastName,
    this.firtsName,
  });

  final String? id;
  final String? email;
  final bool? isActive;
  final String? lastName;
  final String? firtsName;

  UserModel copyWith({
    String? id,
    String? email,
    bool? isActive,
    String? lastName,
    String? firtsName,
  }) =>
      UserModel(
        id: id ?? this.id,
        email: email ?? this.email,
        lastName: lastName ?? this.lastName,
        isActive: isActive ?? this.isActive,
        firtsName: firtsName ?? this.firtsName,
      );

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
