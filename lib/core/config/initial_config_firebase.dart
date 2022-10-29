import 'package:firebase_core/firebase_core.dart';

Future<void> initalConfig() async {
  await Firebase.initializeApp();
}
