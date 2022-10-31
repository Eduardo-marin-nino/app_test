import 'package:flutter/material.dart';
import 'package:app_test/gui/widgets/text_form_input.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:app_test/gui/views/home_view/home_controller.dart';

class InputSearchAddress extends StatelessWidget {
  const InputSearchAddress({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: controller.goSelectAddress,
      child: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        alignment: Alignment.topCenter,
        child: AbsorbPointer(
          child: TextFormInput(
            controller: controller.addressController,
            hintText: 'Dirección',
            icon: Feather.map_pin,
            iconColor: Theme.of(context).colorScheme.primary,
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'La dirección es obligatoria';
              }
              return null;
            },
          ),
        ),
      ),
    );
  }
}
