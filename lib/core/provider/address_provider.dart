import 'package:flutter/material.dart';

import '../../data/models/googlePlace/google_place_autocomplete_model.dart';
import '../../data/models/googlePlace/google_place_details_model.dart';

class AddressProvider with ChangeNotifier {
  GooglePlaceAutocompleteModel? _autocomplete;
  GooglePlaceDetailsModel? _selectedDetailPlace;

  GooglePlaceAutocompleteModel? get autocomplete => _autocomplete;

  set autocomplete(GooglePlaceAutocompleteModel? autocomplete) {
    _autocomplete = autocomplete;
    notifyListeners();
  }

  set autocompleteWithOutNotification(
      GooglePlaceAutocompleteModel? autocomplete) {
    _autocomplete = autocomplete;
  }

  GooglePlaceDetailsModel? get selectedDetailPlace => _selectedDetailPlace;

  set selectedDetailPlace(GooglePlaceDetailsModel? selectedDetailPlace) {
    _selectedDetailPlace = selectedDetailPlace;
    notifyListeners();
  }
}
