// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    id: json['id'] as String?,
    email: json['email'] as String?,
    isActive: json['isActive'] as bool?,
    lastName: json['lastName'] as String?,
    firtsName: json['firtsName'] as String?,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'isActive': instance.isActive,
      'lastName': instance.lastName,
      'firtsName': instance.firtsName,
    };