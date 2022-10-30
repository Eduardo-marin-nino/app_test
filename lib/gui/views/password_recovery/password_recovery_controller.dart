import 'package:app_test/gui/widgets/snackbar_alert.dart';
import 'package:flutter/material.dart';
import 'package:app_test/core/api/auth_firebase_api.dart';
import 'package:app_test/core/utils/auth_exception_firebase.dart';

class RecoverySendMessageController {
  late BuildContext _context;

  //TextEditingControllers
  late TextEditingController emailController;

  //APIS
  final AuthFirebaseApi _authApi = AuthFirebaseApi();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  static final RecoverySendMessageController _singleton =
      RecoverySendMessageController._();
  factory RecoverySendMessageController(BuildContext context) =>
      _singleton._instance(context);
  RecoverySendMessageController._();

  RecoverySendMessageController _instance(BuildContext context) {
    _singleton._context = context;
    return _singleton;
  }

  void init() {
    emailController = TextEditingController();
  }

  void onRequestCode() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      final firebaseResponse =
          await _authApi.resetPasswordForEmail(emailController.text.trim());

      if (firebaseResponse == AuthResultStatus.successful) {
        alertError("Hemos enviado un código de seguridad");
      } else {
        isLoading.value = false;
        final errorMessage =
            AuthExceptionHandler.generateExceptionMessage(firebaseResponse);

        alertError(errorMessage, typeAlert: TypeAlert.error);
      }
    }
  }

  void alertError(String message, {typeAlert = TypeAlert.success}) {
    SnackBarFloating.show(
      _context,
      message,
    );
  }

  void dispose() {
    emailController.dispose();
  }
}
