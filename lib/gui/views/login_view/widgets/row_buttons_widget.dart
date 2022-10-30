import 'package:flutter/material.dart';
import 'package:app_test/core/utils/hooks/use_navigations.dart';

class RowButtonsOptions extends StatelessWidget {
  const RowButtonsOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _recoveryPassword(context),
        GestureDetector(
          onTap: () => useNavigatePushName(context, 'register'),
          child: const Text(
            "Regístrate",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _recoveryPassword(BuildContext context) => GestureDetector(
        onTap: () => useNavigatePushName(context, 'recoveryForEmail'),
        child: Text(
          'Restaurar contraseña',
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
}
