// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_place_autocomplete_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GooglePlaceAutocompleteModel _$GooglePlaceAutocompleteModelFromJson(
    Map<String, dynamic> json) {
  return GooglePlaceAutocompleteModel(
    predictions: (json['predictions'] as List<dynamic>?)
        ?.map((e) => PredictionModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    status: json['status'] as String?,
  );
}

Map<String, dynamic> _$GooglePlaceAutocompleteModelToJson(
        GooglePlaceAutocompleteModel instance) =>
    <String, dynamic>{
      'predictions': instance.predictions,
      'status': instance.status,
    };

PredictionModel _$PredictionModelFromJson(Map<String, dynamic> json) {
  return PredictionModel(
    description: json['description'] as String?,
    matchedSubstrings: (json['matched_substrings'] as List<dynamic>?)
        ?.map((e) => MatchedSubstringModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    placeId: json['place_id'] as String?,
    reference: json['reference'] as String?,
    structuredFormatting: json['structured_formatting'] == null
        ? null
        : StructuredFormattingModel.fromJson(
            json['structured_formatting'] as Map<String, dynamic>),
    terms: (json['terms'] as List<dynamic>?)
        ?.map((e) => TermModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    types: (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$PredictionModelToJson(PredictionModel instance) =>
    <String, dynamic>{
      'place_id': instance.placeId,
      'matched_substrings': instance.matchedSubstrings,
      'structured_formatting': instance.structuredFormatting,
      'description': instance.description,
      'reference': instance.reference,
      'terms': instance.terms,
      'types': instance.types,
    };

MatchedSubstringModel _$MatchedSubstringModelFromJson(
    Map<String, dynamic> json) {
  return MatchedSubstringModel(
    length: json['length'] as int?,
    offset: json['offset'] as int?,
  );
}

Map<String, dynamic> _$MatchedSubstringModelToJson(
        MatchedSubstringModel instance) =>
    <String, dynamic>{
      'length': instance.length,
      'offset': instance.offset,
    };

StructuredFormattingModel _$StructuredFormattingModelFromJson(
    Map<String, dynamic> json) {
  return StructuredFormattingModel(
    mainText: json['main_text'] as String?,
    mainTextMatchedSubstrings: (json['main_text_matched_substrings']
            as List<dynamic>?)
        ?.map((e) => MatchedSubstringModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    secondaryText: json['secondary_text'] as String?,
  );
}

Map<String, dynamic> _$StructuredFormattingModelToJson(
        StructuredFormattingModel instance) =>
    <String, dynamic>{
      'main_text': instance.mainText,
      'secondary_text': instance.secondaryText,
      'main_text_matched_substrings': instance.mainTextMatchedSubstrings,
    };

TermModel _$TermModelFromJson(Map<String, dynamic> json) {
  return TermModel(
    offset: json['offset'] as int?,
    value: json['value'] as String?,
  );
}

Map<String, dynamic> _$TermModelToJson(TermModel instance) => <String, dynamic>{
      'offset': instance.offset,
      'value': instance.value,
    };
