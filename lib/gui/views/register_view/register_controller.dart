import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_test/core/api/user_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_test/gui/widgets/snackbar_alert.dart';
import 'package:app_test/core/api/auth_firebase_api.dart';
import 'package:app_test/core/provider/user_provider.dart';
import 'package:app_test/core/utils/hooks/use_navigations.dart';
import 'package:app_test/data/models/user_model/user_model.dart';
import 'package:app_test/core/utils/auth_exception_firebase.dart';

class RegisterController {
  late BuildContext _context;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController lastNameController;
  late TextEditingController passwordController;

  //APIS
  final AuthFirebaseApi _authApi = AuthFirebaseApi();
  final UserApi _userApi = UserApi();

  //Provider
  late UserProvider _userProvider;

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  static final RegisterController _singleton = RegisterController._();
  factory RegisterController(BuildContext context) =>
      _singleton._instance(context);
  RegisterController._();

  RegisterController _instance(BuildContext context) {
    _singleton._context = context;
    _singleton._userProvider = context.read<UserProvider>();
    return _singleton;
  }

  void init() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    lastNameController = TextEditingController();
    passwordController = TextEditingController();
  }

  void onRegister() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      final firebaseResponse = await _authApi.createAccount(
          emailController.text.trim().toLowerCase(),
          passwordController.text.trim());

      isLoading.value = false;

      if (firebaseResponse!.status == AuthResultStatus.successful) {
        createUser(firebaseResponse.credentialUser!);
      } else {
        isLoading.value = false;
        final errorMessage = AuthExceptionHandler.generateExceptionMessage(
            firebaseResponse.status);

        _alertError(errorMessage);
      }
    }
  }

  void createUser(UserCredential credential) async {
    final UserModel user = UserModel(
      isActive: true,
      id: credential.user!.uid,
      email: emailController.text.trim().toLowerCase(),
      firtsName: nameController.text.trim(),
      lastName: lastNameController.text.trim(),
    );

    final created = await _userApi.createUser(user);

    if (created) {
      isLoading.value = false;
      _userProvider.user = user;
      _userProvider.userAuth = credential.user;
      _redirect();
    }
  }

  void _redirect() {
    useNavigateReplaceName(_context, 'main');
  }

  void _alertError(String message) {
    SnackBarFloating.show(
      _context,
      message,
      type: TypeAlert.error,
    );
  }

  void dispose() {
    isLoading.value = false;
    nameController.dispose();
    emailController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
  }
}
