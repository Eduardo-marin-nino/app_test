import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_test/core/utils/auth_exception_firebase.dart';

class FirebaseResponseModel {
  final bool? isReset;
  final AuthResultStatus? status;
  final UserCredential? credentialUser;

  FirebaseResponseModel({
    this.status,
    this.isReset,
    this.credentialUser,
  });
}
