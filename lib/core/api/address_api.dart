import 'package:app_test/core/config/constants.dart';
import 'package:app_test/data/models/googlePlace/google_place_details_model.dart';
import 'package:dio/dio.dart';
import 'package:app_test/data/models/googlePlace/google_place_autocomplete_model.dart';
import 'package:logger/logger.dart';

class AddressApi {
  final Dio dio = Dio();
  final Logger logger = Logger();

  Future<GooglePlaceAutocompleteModel?> getPlaces(String input) async {
    try {
      final response = await dio.get(
        "$urlGooglePlaces/$urlPlacesAutocomplete",
        queryParameters: {
          'input': input,
          'language': 'es',
          'components': 'country:co',
          'key': apiKeyGMapsAndroid,
        },
      );
      return GooglePlaceAutocompleteModel.fromJson(response.data);
    } catch (e) {
      logger.e('getPlaces: $e');
      return null;
    }
  }

  Future<GooglePlaceDetailsModel?> getDetailPlace(String placeId) async {
    try {
      final response = await dio.get(
        "$urlGooglePlaces/$urlPlacesDetails",
        queryParameters: {
          'place_id': placeId,
          'language': 'es',
          'key': apiKeyGMapsAndroid,
        },
      );
      return GooglePlaceDetailsModel.fromJson(response.data);
    } catch (e) {
      logger.e('getDetailPlace: $e');
      return null;
    }
  }
}
