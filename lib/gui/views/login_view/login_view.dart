import 'package:flutter/material.dart';
import 'package:app_test/gui/widgets/button_generic.dart';
import 'package:app_test/gui/widgets/text_form_input.dart';
import 'package:app_test/gui/templates/auth_template.dart';
import 'package:app_test/gui/widgets/activity_indicator.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:app_test/core/utils/hooks/use_validations.dart';
import 'package:app_test/gui/views/login_view/login_controller.dart';

import 'widgets/row_buttons_widget.dart';
import 'widgets/button_social_authentication.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginController controller;

  @override
  void initState() {
    controller = LoginController(context)..init();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthTemplate(
      heightTemplate: 0.13,
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Iniciar sesión',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 20),
            TextFormInput(
              controller: controller.emailController,
              hintText: 'Ingresa tu correo',
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'El email obligatorio';
                } else if (!useValidateEmail(value)) {
                  return 'Formato inválido';
                }
                return null;
              },
              onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
            ),
            const SizedBox(height: 20),
            TextFormInput(
              controller: controller.passwordController,
              hintText: 'Ingresa tu contraseña',
              obscureText: true,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'La contraseña es obligatoria';
                }
                return null;
              },
              onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
            ),
            const SizedBox(height: 30),
            ValueListenableBuilder(
              valueListenable: controller.isLoading,
              builder: (BuildContext _, bool loading, Widget? __) {
                return loading
                    ? const ActivityIndicator()
                    : Align(
                        alignment: Alignment.center,
                        child: ButtonWidget(
                          width: 220,
                          label: 'Iniciar sesión',
                          onTap: controller.onLogin,
                        ),
                      );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ButtonAuthentication(
                icon: MaterialCommunityIcons.google,
                onTap: controller.signInWithGoogle,
              ),
            ),
            const SizedBox(height: 30),
            const RowButtonsOptions()
          ],
        ),
      ),
    );
  }
}
