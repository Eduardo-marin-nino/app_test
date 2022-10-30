import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_test/core/paths/app_paths.dart';
import 'package:app_test/core/theme/app_theme.dart';
import 'package:app_test/core/provider/index_provider.dart';

import 'core/config/initial_config_firebase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initalConfig();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: storeProviders,
      child: MaterialApp(
        initialRoute: "/",
        theme: AppTheme.light(),
        themeMode: ThemeMode.light,
        onGenerateRoute: RouterGenerator.generateRoute,
      ),
    );
  }
}
