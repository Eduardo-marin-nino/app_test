import 'package:app_test/core/provider/address_provider.dart';
import 'package:app_test/core/provider/bottom_bar_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:app_test/core/provider/user_provider.dart';

List<SingleChildWidget> storeProviders = [
  ChangeNotifierProvider(create: (_) => UserProvider()),
  ChangeNotifierProvider(create: (_) => AddressProvider()),
  ChangeNotifierProvider(create: (_) => BottomBarProvider()),
];
