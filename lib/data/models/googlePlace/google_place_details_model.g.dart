// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_place_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GooglePlaceDetailsModel _$GooglePlaceDetailsModelFromJson(
    Map<String, dynamic> json) {
  return GooglePlaceDetailsModel(
    htmlAttributions: json['html_attributions'] as List<dynamic>?,
    result: json['result'] == null
        ? null
        : GpdResultModel.fromJson(json['result'] as Map<String, dynamic>),
    status: json['status'] as String?,
  );
}

Map<String, dynamic> _$GooglePlaceDetailsModelToJson(
        GooglePlaceDetailsModel instance) =>
    <String, dynamic>{
      'html_attributions': instance.htmlAttributions,
      'result': instance.result,
      'status': instance.status,
    };

GpdResultModel _$GpdResultModelFromJson(Map<String, dynamic> json) {
  return GpdResultModel(
    addressComponents: (json['address_components'] as List<dynamic>?)
        ?.map(
            (e) => GpdAddressComponentModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    adrAddress: json['adr_address'] as String?,
    formattedAddress: json['formatted_address'] as String?,
    geometry: json['geometry'] == null
        ? null
        : GpdGeometryModel.fromJson(json['geometry'] as Map<String, dynamic>),
    icon: json['icon'] as String?,
    iconBackgroundColor: json['icon_background_color'] as String?,
    iconMaskBaseUri: json['icon_mask_base_uri'] as String?,
    name: json['name'] as String?,
    photos: (json['photos'] as List<dynamic>?)
        ?.map((e) => GpdPhotoModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    placeId: json['place_id'] as String?,
    reference: json['reference'] as String?,
    types: (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
    url: json['url'] as String?,
    utcOffset: json['utc_offset'] as int?,
    vicinity: json['vicinity'] as String?,
  );
}

Map<String, dynamic> _$GpdResultModelToJson(GpdResultModel instance) =>
    <String, dynamic>{
      'address_components': instance.addressComponents,
      'adr_address': instance.adrAddress,
      'formatted_address': instance.formattedAddress,
      'icon_background_color': instance.iconBackgroundColor,
      'icon_mask_base_uri': instance.iconMaskBaseUri,
      'place_id': instance.placeId,
      'utc_offset': instance.utcOffset,
      'types': instance.types,
      'photos': instance.photos,
      'geometry': instance.geometry,
      'icon': instance.icon,
      'name': instance.name,
      'reference': instance.reference,
      'url': instance.url,
      'vicinity': instance.vicinity,
    };

GpdAddressComponentModel _$GpdAddressComponentModelFromJson(
    Map<String, dynamic> json) {
  return GpdAddressComponentModel(
    longName: json['long_name'] as String?,
    shortName: json['short_name'] as String?,
    types: (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$GpdAddressComponentModelToJson(
        GpdAddressComponentModel instance) =>
    <String, dynamic>{
      'long_name': instance.longName,
      'short_name': instance.shortName,
      'types': instance.types,
    };

GpdGeometryModel _$GpdGeometryModelFromJson(Map<String, dynamic> json) {
  return GpdGeometryModel(
    location: json['location'] == null
        ? null
        : GpdLocationModel.fromJson(json['location'] as Map<String, dynamic>),
    viewport: json['viewport'] == null
        ? null
        : GpdViewportModel.fromJson(json['viewport'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GpdGeometryModelToJson(GpdGeometryModel instance) =>
    <String, dynamic>{
      'location': instance.location,
      'viewport': instance.viewport,
    };

GpdLocationModel _$GpdLocationModelFromJson(Map<String, dynamic> json) {
  return GpdLocationModel(
    lat: (json['lat'] as num?)?.toDouble(),
    lng: (json['lng'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$GpdLocationModelToJson(GpdLocationModel instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

GpdViewportModel _$GpdViewportModelFromJson(Map<String, dynamic> json) {
  return GpdViewportModel(
    northeast: json['northeast'] == null
        ? null
        : GpdLocationModel.fromJson(json['northeast'] as Map<String, dynamic>),
    southwest: json['southwest'] == null
        ? null
        : GpdLocationModel.fromJson(json['southwest'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GpdViewportModelToJson(GpdViewportModel instance) =>
    <String, dynamic>{
      'northeast': instance.northeast,
      'southwest': instance.southwest,
    };

GpdPhotoModel _$GpdPhotoModelFromJson(Map<String, dynamic> json) {
  return GpdPhotoModel(
    htmlAttributions: (json['html_attributions'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    photoReference: json['photo_reference'] as String?,
    height: json['height'] as int?,
    width: json['width'] as int?,
  );
}

Map<String, dynamic> _$GpdPhotoModelToJson(GpdPhotoModel instance) =>
    <String, dynamic>{
      'html_attributions': instance.htmlAttributions,
      'photo_reference': instance.photoReference,
      'height': instance.height,
      'width': instance.width,
    };
