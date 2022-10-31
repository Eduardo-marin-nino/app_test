import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'address_model.g.dart';

@JsonSerializable()
class AddressModel {
  AddressModel({
    this.name,
    required this.address,
    required this.coordinates,
  });

  final String? name;
  final String address;

  @JsonKey(fromJson: _fromJsonGeoPoint, toJson: _toJsonGeoPoint)
  final GeoPoint coordinates;

  AddressModel copyWith({
    String? name,
    String? address,
    GeoPoint? coordinates,
  }) =>
      AddressModel(
        name: name ?? this.name,
        address: address ?? this.address,
        coordinates: coordinates ?? this.coordinates,
      );

  factory AddressModel.fromRawJson(String str) =>
      AddressModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  static GeoPoint _fromJsonGeoPoint(GeoPoint geoPoint) {
    return geoPoint;
  }

  static GeoPoint _toJsonGeoPoint(GeoPoint geoPoint) {
    return geoPoint;
  }

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}
