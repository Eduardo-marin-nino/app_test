import 'package:logger/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:app_test/core/utils/auth_exception_firebase.dart';
import 'package:app_test/data/models/firebase_response_model.dart';

class AuthFirebaseApi {
  final Logger _logger = Logger();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<FirebaseResponseModel?> signIn(
    String email,
    String password,
  ) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return FirebaseResponseModel(
          credentialUser: userCredential, status: AuthResultStatus.successful);
    } on FirebaseAuthException catch (e) {
      return FirebaseResponseModel(
          status: AuthExceptionHandler.handleException(e),
          credentialUser: null);
    }
  }

  Future<FirebaseResponseModel?> createAccount(
    String email,
    String password,
  ) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return FirebaseResponseModel(
        credentialUser: userCredential,
        status: AuthResultStatus.successful,
      );
    } on FirebaseException catch (e) {
      return FirebaseResponseModel(
        status: AuthExceptionHandler.handleException(e),
        credentialUser: null,
      );
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      signOut();
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await _firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      _logger.e("signInWithGoogle $e");
      return null;
    }
  }

  Future<AuthResultStatus?> resetPasswordForEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return AuthResultStatus.successful;
    } on FirebaseAuthException catch (e) {
      return AuthExceptionHandler.handleException(e);
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
