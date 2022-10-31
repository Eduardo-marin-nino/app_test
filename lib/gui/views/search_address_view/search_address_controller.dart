import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_test/core/utils/location.dart';
import 'package:app_test/core/api/address_api.dart';
import 'package:app_test/core/utils/debouncer.dart';
import 'package:app_test/gui/widgets/snackbar_alert.dart';
import 'package:app_test/core/provider/user_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:app_test/core/provider/address_provider.dart';
import 'package:app_test/core/utils/hooks/use_navigations.dart';
import 'package:app_test/data/models/googlePlace/google_place_details_model.dart';
import 'package:app_test/data/models/googlePlace/google_place_autocomplete_model.dart';

class SearchAddressController {
  late BuildContext context;

  final AddressApi _addressApi = AddressApi();

  late UserProvider _userProvider;
  late AddressProvider _addressProvider;

  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  static final SearchAddressController _singleton = SearchAddressController._();
  factory SearchAddressController(BuildContext context) =>
      _singleton._instance(context);
  SearchAddressController._();

  SearchAddressController _instance(BuildContext context) {
    _singleton.context = context;
    _singleton._userProvider = context.read<UserProvider>();
    _singleton._addressProvider = context.read<AddressProvider>();
    return _singleton;
  }

  void searchAddress(String address) {
    debouncer.run(() async {
      isLoading.value = true;
      final GooglePlaceAutocompleteModel? response =
          await _addressApi.getPlaces(address);

      isLoading.value = false;

      if (response!.predictions!.isNotEmpty) {
        _addressProvider.autocomplete = response;
      }
    });
  }

  void selectedPrediction(PredictionModel prediction) async {
    final GooglePlaceDetailsModel? detail =
        await _addressApi.getDetailPlace(prediction.placeId!);
    _addressProvider.selectedDetailPlace = detail;
    _userProvider.currentPosition = LatLng(
      detail!.result!.geometry!.location!.lat!,
      detail.result!.geometry!.location!.lng!,
    );
    _userProvider.textInput = detail.result?.formattedAddress ?? '';
    redirect();
  }

  void findAddressMap() async {
    _addressProvider.selectedDetailPlace = null;
    final hasPermissionLocation = await LocationComponent.validate();
    if (hasPermissionLocation) {
      final currentPosition = await LocationComponent.get();
      _userProvider.currentPosition = LatLng(
        currentPosition.latitude ?? 4.6482837,
        currentPosition.longitude ?? -74.2478913,
      );
      redirect();
    } else {
      _alert();
    }
  }

  void redirect() {
    useNavigatePop(context);
  }

  void _alert() {
    SnackBarFloating.show(
      context,
      "Necesitamos acceso a tu ubicación",
      type: TypeAlert.error,
    );
  }
}
