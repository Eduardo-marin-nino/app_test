import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_test/core/paths/app_paths.dart';
import 'package:app_test/core/theme/app_theme.dart';
import 'package:app_test/core/provider/index_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.storeProviders,
      child: MaterialApp(
        initialRoute: "/",
        theme: AppTheme.light(),
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouterGenerator.generateRoute,
      ),
    );
  }
}
