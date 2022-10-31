import 'dart:async';

import 'package:flutter/material.dart';
import 'package:app_test/core/paths/local_paths.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:app_test/gui/widgets/activity_indicator.dart';
import 'package:app_test/gui/views/home_view/home_controller.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final Completer<GoogleMapController> mapController = Completer();

  late HomeController controller;

  bool isLoading = true;

  @override
  void initState() {
    _getPosition();
    super.initState();
  }

  void _getPosition() async {
    controller = HomeController(context);
    await controller.initData(mapController);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        GoogleMap(
          mapType: MapType.normal,
          compassEnabled: false,
          myLocationButtonEnabled: false,
          padding: EdgeInsets.only(bottom: size.height * .3),
          initialCameraPosition: CameraPosition(
            target: controller.userLocation,
            zoom: 14.4746,
          ),
          onCameraMove: controller.onCameraMove,
          onMapCreated: (GoogleMapController googleMapController) {
            mapController.complete(googleMapController);
          },
        ),
        Positioned(
          left: 0,
          right: 0,
          top: (size.height * .32),
          child: Center(
            child: isLoading
                ? const ActivityIndicator()
                : Image.asset(
                    LocalPaths.ubication,
                    fit: BoxFit.contain,
                    height: 35,
                  ),
          ),
        )
      ],
    );
  }
}
