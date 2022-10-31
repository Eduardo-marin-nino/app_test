import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_test/core/provider/user_provider.dart';
import 'package:app_test/core/theme/colors_app_theme.dart';
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
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(20),
        child: ListTile(
          onTap: controller.goSelectAddress,
          leading: const Icon(
            Feather.map_pin,
            color: ColorsAppTheme.primaryColor,
            size: 25,
          ),
          title: _textAddress(),
          trailing: const Icon(
            Icons.keyboard_arrow_right_sharp,
            color: ColorsAppTheme.primaryColor,
            size: 25,
          ),
        ),
      ),
    );
  }

  Widget _textAddress() => Consumer<UserProvider>(
        builder: (_, userProvider, __) => Text(
          userProvider.textInput,
          style: const TextStyle(fontSize: 14),
        ),
      );
}
