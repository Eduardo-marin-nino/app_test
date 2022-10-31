import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_test/core/api/user_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_test/gui/widgets/snackbar_alert.dart';
import 'package:app_test/core/api/auth_firebase_api.dart';
import 'package:app_test/core/provider/user_provider.dart';
import 'package:app_test/core/utils/hooks/use_navigations.dart';
import 'package:app_test/data/models/user_model/user_model.dart';
import 'package:app_test/core/utils/auth_exception_firebase.dart';

class LoginController {
  late BuildContext _context;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  //Providers
  late UserProvider _userProvider;

  //APIS
  final UserApi _userApi = UserApi();
  final AuthFirebaseApi _authFirebaseApi = AuthFirebaseApi();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isLoadingData = ValueNotifier<bool>(false);

  static final LoginController _singleton = LoginController._();
  factory LoginController(BuildContext context) =>
      _singleton._instance(context);
  LoginController._();

  LoginController _instance(BuildContext context) {
    _singleton._context = context;
    _singleton._userProvider = context.read<UserProvider>();
    return _singleton;
  }

  void init() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  void onLogin() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      final firebaseResponse = await _authFirebaseApi.signIn(
        emailController.text.trim().toLowerCase(),
        passwordController.text.trim(),
      );
      isLoading.value = false;
      if (firebaseResponse!.status == AuthResultStatus.successful) {
        final userDetail =
            await _userApi.getUser(firebaseResponse.credentialUser!.user!.uid);

        if (userDetail != null && userDetail.exists) {
          _redirect("main");
        }
      } else {
        isLoading.value = false;
        final errorMessage = AuthExceptionHandler.generateExceptionMessage(
            firebaseResponse.status);
        alertError(errorMessage);
        redirectPush();
      }
    }
  }

  void signInWithGoogle() async {
    final UserCredential? credential =
        await _authFirebaseApi.signInWithGoogle();

    isLoadingData.value = true;

    if (credential != null) {
      final DocumentSnapshot<UserModel?>? docUser =
          await _userApi.getUser(credential.user!.uid);

      if (docUser != null && docUser.exists) {
        isLoadingData.value = false;
        _userProvider.userAuth = credential.user;
        _userProvider.user = docUser.data();
        _redirect("main");
      } else {
        _createUserFireStore(credential);
      }
    } else {
      isLoadingData.value = false;
      alertError("Ocurrio un error, intenta de nuevo");
    }
  }

  void _createUserFireStore(UserCredential userCredential) async {
    final UserModel user = UserModel(
      firtsName: userCredential.user!.displayName?.split(' ')[0],
      id: userCredential.user!.uid,
      email: userCredential.user!.email ?? '',
      isActive: true,
      lastName: userCredential.user?.displayName?.split(' ')[1],
    );

    final bool response = await _userApi.createUser(user);
    isLoadingData.value = false;

    if (response) {
      _userProvider.userAuth = userCredential.user;
      _userProvider.user = user;
      _redirect("main");
    } else {
      alertError("Hubo un error al registrarse con google");
    }
  }

  void _redirect(String route) {
    useNavigateReplaceName(_context, route);
  }

  void redirectPush() {
    useNavigatePushName(_context, "register");
  }

  void alertError(String message) {
    SnackBarFloating.show(
      _context,
      message,
      type: TypeAlert.error,
    );
  }

  void dispose() {
    isLoading.value = false;
    emailController.dispose();
    passwordController.dispose();
  }
}
