import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_test/core/provider/user_provider.dart';
import 'package:app_test/core/utils/hooks/use_navigations.dart';
import 'package:app_test/data/models/user_model/user_model.dart';

class RegisterController {
  late BuildContext _context;
  late TextEditingController nameController;
  late TextEditingController directionController;
  late TextEditingController lastNameController;

  //Provider
  late UserProvider _userProvider;

  DateTime? birthDay;

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
    lastNameController = TextEditingController();
    directionController = TextEditingController();
  }

  void onRegister() {
    if (formKey.currentState!.validate()) {
      final user = UserModel(
        firtsName: nameController.text,
        lastName: lastNameController.text,
        direction: directionController.text,
        birthDate: birthDay?.toString(),
      );
      _userProvider.user = user;
      useNavigateReplacePage(_context, "profile");
    }
  }

  void dispose() {
    birthDay = null;
    nameController.dispose();
    lastNameController.dispose();
    directionController.dispose();
  }
}
