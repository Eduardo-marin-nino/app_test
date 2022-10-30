import 'package:app_test/core/utils/hooks/use_navigations.dart';
import 'package:app_test/gui/widgets/snackbar_alert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_test/core/api/user_api.dart';
import 'package:app_test/core/api/auth_firebase_api.dart';
import 'package:app_test/core/provider/user_provider.dart';
import 'package:app_test/core/utils/auth_exception_firebase.dart';

class LoginController {
  late BuildContext _context;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  //APIS
  final UserApi _userApi = UserApi();
  final AuthFirebaseApi _authFirebaseApi = AuthFirebaseApi();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  static final LoginController _singleton = LoginController._();
  factory LoginController(BuildContext context) =>
      _singleton._instance(context);
  LoginController._();

  LoginController _instance(BuildContext context) {
    _singleton._context = context;
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

        if (userDetail != null) {
          _redirect();
        }
      } else {
        isLoading.value = false;
        final errorMessage = AuthExceptionHandler.generateExceptionMessage(
            firebaseResponse.status);
        alertError(errorMessage);
      }
    }
  }

  void _redirect() {
    useNavigateReplaceName(_context, 'main');
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
