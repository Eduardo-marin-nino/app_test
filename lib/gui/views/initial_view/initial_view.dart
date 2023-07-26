import 'package:flutter/material.dart';
import 'package:app_test/gui/widgets/button_generic.dart';
import 'package:app_test/gui/templates/auth_template.dart';
import 'package:app_test/core/utils/hooks/use_navigations.dart';

class InitialView extends StatelessWidget {
  const InitialView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthTemplate(
      heightTemplate: 0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Bienvenido',
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 50),
          Center(
            child: ButtonWidget(
              width: 220,
              label: 'Registrate',
              onTap: () => useNavigateReplaceName(context, "profile"),
            ),
          ),
        ],
      ),
    );
  }
}
