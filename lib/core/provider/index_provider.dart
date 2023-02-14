import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:app_test/core/provider/user_provider.dart';
import 'package:app_test/core/provider/disposable_provider.dart';

class AppProviders {
  static List<DisposableProvider> _getDisposableProviders(
    BuildContext context,
  ) {
    return [
      context.read<UserProvider>(),
    ];
  }

  static List<SingleChildWidget> storeProviders = [
    ChangeNotifierProvider(create: (_) => UserProvider()),
  ];

  static Future<void> disposeAllDisposableProviders(
    BuildContext context,
  ) async {
    await Future.forEach(
      _getDisposableProviders(context),
      (DisposableProvider provider) async {
        provider.disposeValues();
      },
    );
  }
}
