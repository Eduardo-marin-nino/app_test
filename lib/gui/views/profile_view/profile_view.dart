import 'package:flutter/material.dart';
import 'package:app_test/gui/widgets/app_bar.dart';
import 'package:app_test/gui/widgets/button_generic.dart';

import 'profile_controller.dart';
import 'widgets/card_profile_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = ProfileController(context);
    return Scaffold(
      appBar: const CustomAppBar(
        centerTitle: true,
        title: Text('Perfil'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CardProfile(),
            const SizedBox(height: 45),
            ButtonWidget(
              label: "Cerrar Sesión",
              fontSize: 14,
              fontWeight: FontWeight.w600,
              onTap: profileController.logout,
            ),
          ],
        ),
      ),
    );
  }
}
