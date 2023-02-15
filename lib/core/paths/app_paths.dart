import 'package:flutter/material.dart';
import 'package:app_test/gui/views/initial_view/initial_view.dart';
import 'package:app_test/gui/views/profile_view/profile_view.dart';
import 'package:app_test/gui/views/register_view/register_view.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final routesMap = {
      '/': MaterialPageRoute(
        builder: (_) => const InitialView(),
      ),
      'register': MaterialPageRoute(
        builder: (_) => const RegisterView(),
      ),
      'profile': MaterialPageRoute(
        builder: (_) => const ProfileView(),
      ),
    };
    return routesMap[settings.name!] ?? routesMap['/']!;
  }
}
