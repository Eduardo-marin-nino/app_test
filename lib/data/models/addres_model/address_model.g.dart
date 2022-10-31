// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      name: json['name'] as String?,
      address: json['address'] as String,
      coordinates:
          AddressModel._fromJsonGeoPoint(json['coordinates'] as GeoPoint),
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'coordinates': AddressModel._toJsonGeoPoint(instance.coordinates),
    };
