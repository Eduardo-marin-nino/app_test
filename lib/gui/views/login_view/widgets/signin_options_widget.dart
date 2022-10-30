import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'button_social_authentication.dart';

class SigninOptions extends StatelessWidget {
  const SigninOptions({
    Key? key,
    this.onTapFacebook,
    this.onTapGoogle,
  }) : super(key: key);

  final VoidCallback? onTapFacebook;
  final VoidCallback? onTapGoogle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ButtonAuthentication(
          icon: MaterialCommunityIcons.google,
          onTap: onTapGoogle,
        ),
        const SizedBox(width: 15),
        ButtonAuthentication(
          icon: Feather.facebook,
          onTap: onTapFacebook,
        ),
      ],
    );
  }
}
