import 'package:flutter/material.dart';
import 'package:app_test/gui/widgets/app_bar.dart';
import 'package:app_test/gui/widgets/card_form_auth.dart';
import 'package:app_test/gui/widgets/background_gradient.dart';

class AuthTemplate extends StatelessWidget {
  final Widget child;
  final double? heightTemplate;

  const AuthTemplate({
    Key? key,
    this.heightTemplate,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        showGradient: false,
      ),
      body: BackGroundGradient(
        child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SizedBox(
              width: size.width,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CardFormAuth(
                  child: child,
                ),
              ),
            )),
      ),
    );
  }
}
