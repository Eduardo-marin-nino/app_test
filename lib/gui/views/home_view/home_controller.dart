import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_test/core/utils/geocode.dart';
import 'package:app_test/core/utils/location.dart';
import 'package:app_test/core/utils/debouncer.dart';
import 'package:app_test/core/provider/user_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:app_test/core/utils/hooks/use_navigations.dart';

class HomeController {
  late BuildContext _context;
  LatLng userLocation = const LatLng(4.6482837, -74.2478913);

  late Completer<GoogleMapController> controllerGMController;

  late String? textInput;
  final GeocodeComponent _geocodeComponent = GeocodeComponent();

  //Provider
  late UserProvider _userProvider;

  static final HomeController _singleton = HomeController._();
  factory HomeController(BuildContext context) => _singleton._instance(context);
  HomeController._();

  HomeController _instance(BuildContext context) {
    _singleton._context = context;
    _singleton._userProvider = context.read<UserProvider>();
    return _singleton;
  }

  Future<void> initData(Completer<GoogleMapController> controller) async {
    final hasPermissionLocation = await LocationComponent.validate();
    if (hasPermissionLocation) {
      final currentPosition = await LocationComponent.get();
      userLocation = LatLng(
        currentPosition.latitude ?? 4.6482837,
        currentPosition.longitude ?? -74.2478913,
      );

      controllerGMController = controller;

      controller.future.then(
        (GoogleMapController googleMapController) =>
            googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: userLocation,
              zoom: 16,
            ),
          ),
        ),
      );
    }

    return;
  }

  void setSelectedAddress() {
    final address = _userProvider.selectedAddress;
    _userProvider.textInput = address!.address;
    controllerGMController.future.then(
      (GoogleMapController googleMapController) =>
          googleMapController.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              address.coordinates.latitude,
              address.coordinates.longitude,
            ),
            zoom: 16,
          ),
        ),
      ),
    );
  }

  Future<void> onCameraMove(CameraPosition cameraPosition) async {
    debouncer.run(() async {
      final String address = await _geocodeComponent.address(
        cameraPosition.target.latitude,
        cameraPosition.target.longitude,
      );
      userLocation = cameraPosition.target;
      _userProvider.textInput = address;
    });
  }

  void goSelectAddress() {
    useNavigatePushName(
      _context,
      "searchAddres",
    );
  }

  void dispose() {
    userLocation = const LatLng(4.6482837, -74.2478913);
  }
}
