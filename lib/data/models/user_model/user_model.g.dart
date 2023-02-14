// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      lastName: json['lastName'] as String?,
      direction: json['direction'] as String?,
      firtsName: json['firtsName'] as String?,
      birthDate: json['birthDate'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'lastName': instance.lastName,
      'direction': instance.direction,
      'firtsName': instance.firtsName,
      'birthDate': instance.birthDate,
    };
