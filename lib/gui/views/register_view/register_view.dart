import 'package:app_test/gui/widgets/input_datetime.dart';
import 'package:flutter/material.dart';
import 'package:app_test/gui/widgets/button_generic.dart';
import 'package:app_test/gui/templates/auth_template.dart';
import 'package:app_test/gui/widgets/text_form_input.dart';
import 'package:app_test/core/utils/hooks/use_validations.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'register_controller.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late RegisterController controller;

  @override
  void initState() {
    controller = RegisterController(context)..init();
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
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Registro',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormInput(
              controller: controller.nameController,
              keyBoardType: TextInputType.text,
              hintText: 'Nombre',
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'El nombre obligatorio';
                }
                return null;
              },
              onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
            ),
            const SizedBox(height: 20),
            TextFormInput(
              controller: controller.lastNameController,
              keyBoardType: TextInputType.text,
              hintText: 'Apellido',
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'El apellido obligatorio';
                }
                return null;
              },
              onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
            ),
            const SizedBox(height: 20),
            TextFormInput(
              controller: controller.directionController,
              keyBoardType: TextInputType.emailAddress,
              hintText: 'Ingresa tu dirección',
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'La dirección es obligatoria';
                }
                return null;
              },
              onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
            ),
            const SizedBox(height: 20),
            InputDateTime(
              hint: 'Fecha de nacimiento',
              icon: Feather.calendar,
              initialDate: controller.birthDay,
              onConfirm: (DateTime value) {
                controller.birthDay = value;
              },
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'La fecha es obligatoria';
                }
                return null;
              },
              title: "Selecciona la fecha",
            ),
            const SizedBox(height: 30),
            Center(
              child: ButtonWidget(
                label: 'Crear cuenta',
                onTap: controller.onRegister,
                width: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
