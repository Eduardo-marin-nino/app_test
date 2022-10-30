import 'package:flutter/material.dart';
import 'package:app_test/gui/views/login_view/login_view.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final routesMap = {
      '/': MaterialPageRoute(
        builder: (_) => const LoginView(),
      )
    };
    return routesMap[settings.name!] ?? routesMap['/']!;
  }
}
