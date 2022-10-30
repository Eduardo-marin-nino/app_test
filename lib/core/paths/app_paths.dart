import 'package:app_test/gui/views/password_recovery/password_recovery.dart';
import 'package:flutter/material.dart';
import 'package:app_test/gui/views/login_view/login_view.dart';
import 'package:app_test/gui/views/register_view/register_view.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final routesMap = {
      '/': MaterialPageRoute(
        builder: (_) => const LoginView(),
      ),
      'register': MaterialPageRoute(
        builder: (_) => const RegisterView(),
      ),
      'recoveryForEmail': MaterialPageRoute(
        builder: (_) => const RecoveryForEmail(),
      ),
    };
    return routesMap[settings.name!] ?? routesMap['/']!;
  }
}
