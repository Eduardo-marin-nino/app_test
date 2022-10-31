import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_test/core/provider/user_provider.dart';
import 'package:app_test/gui/views/home_view/widgets/input_search_address.dart';

import 'home_controller.dart';
import 'widgets/map_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeController controller;
  late final UserProvider _userProvider;

  @override
  void initState() {
    controller = HomeController(context);
    _userProvider = context.read<UserProvider>();
    _userProvider.addListener(listenerChangeProvider);
    super.initState();
  }

  @override
  void dispose() {
    _userProvider.removeListener(listenerChangeProvider);
    controller.dispose();
    super.dispose();
  }

  void listenerChangeProvider() {
    if (_userProvider.selectedAddress != null) {
      controller.setSelectedAddress();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          const MapWidget(),
          InputSearchAddress(controller: controller),
        ],
      ),
    );
  }
}
