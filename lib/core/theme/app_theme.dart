import 'package:app_test/core/theme/colors_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData light() {
    final ThemeData theme = ThemeData(
      fontFamily: 'Montserrat',
      brightness: Brightness.light,
      primaryColor: ColorsAppTheme.primaryColor,
      scaffoldBackgroundColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
    );

    return theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(
        primary: ColorsAppTheme.primaryColor,
        secondary: ColorsAppTheme.secondColor,
      ),
    );
  }
}
