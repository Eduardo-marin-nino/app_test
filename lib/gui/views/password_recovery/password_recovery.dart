import 'package:flutter/material.dart';
import 'package:app_test/gui/widgets/button_generic.dart';
import 'package:app_test/gui/templates/auth_template.dart';
import 'package:app_test/gui/widgets/text_form_input.dart';
import 'package:app_test/core/utils/hooks/use_navigations.dart';
import 'package:app_test/core/utils/hooks/use_validations.dart';

import 'password_recovery_controller.dart';

class RecoveryForEmail extends StatefulWidget {
  const RecoveryForEmail({Key? key}) : super(key: key);

  @override
  State<RecoveryForEmail> createState() => _RecoveryForEmailState();
}

class _RecoveryForEmailState extends State<RecoveryForEmail> {
  late RecoverySendMessageController controller;

  @override
  void initState() {
    controller = RecoverySendMessageController(context)..init();
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
      heightTemplate: 0.2,
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Restaurar contraseña',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormInput(
              controller: controller.emailController,
              keyBoardType: TextInputType.emailAddress,
              hintText: 'Ingresa tu correo',
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'El email obligatorio';
                } else if (!useValidateEmail(value)) {
                  return 'Formato inválido';
                }
                return null;
              },
            ),
            const SizedBox(height: 35),
            ButtonWidget(
              label: 'Solicitar código',
              width: 200,
              onTap: controller.onRequestCode,
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () => useNavigatePop(context),
              child: const Text(
                'Iniciar sesión',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
