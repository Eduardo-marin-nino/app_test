import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  const UserModel({
    this.lastName,
    this.direction,
    this.firtsName,
    this.birthDate,
  });

  final String? lastName;
  final String? direction;
  final String? firtsName;
  final String? birthDate;

  UserModel copyWith({
    String? lastName,
    String? direction,
    String? firtsName,
    String? birthDate,
  }) =>
      UserModel(
        lastName: lastName ?? this.lastName,
        direction: direction ?? this.direction,
        firtsName: firtsName ?? this.firtsName,
        birthDate: birthDate ?? this.birthDate,
      );

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
