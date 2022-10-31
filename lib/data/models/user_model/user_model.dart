import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
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
    this.reference,
  });

  final String? id;
  final String? email;
  final bool? isActive;
  final String? lastName;
  final String? firtsName;

  @JsonKey(
    fromJson: _fromJsonDocumentReference,
    toJson: _toJsonDocumentReference,
  )
  final DocumentReference? reference;

  UserModel copyWith({
    String? id,
    String? email,
    bool? isActive,
    String? lastName,
    String? firtsName,
    DocumentReference? reference,
  }) =>
      UserModel(
        id: id ?? this.id,
        email: email ?? this.email,
        lastName: lastName ?? this.lastName,
        isActive: isActive ?? this.isActive,
        firtsName: firtsName ?? this.firtsName,
        reference: reference ?? this.reference,
      );

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  static DocumentReference? _fromJsonDocumentReference(
      DocumentReference? documentReference) {
    return documentReference;
  }

  static DocumentReference? _toJsonDocumentReference(
      DocumentReference? documentReference) {
    return documentReference;
  }

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
