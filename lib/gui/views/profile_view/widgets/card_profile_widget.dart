import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_test/core/provider/user_provider.dart';
import 'package:app_test/data/models/user_model/user_model.dart';
import 'package:app_test/gui/views/profile_view/widgets/card.dart';

import 'avatar_widget.dart';

class CardProfile extends StatelessWidget {
  const CardProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserModel user = context.watch<UserProvider>().user;
    return CardWidget(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const AvatarProfile(),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _information(
                  title: 'Nombre y Apellido',
                  subTitle: "${user.firtsName} ${user.lastName}",
                ),
                _information(
                  title: 'Dirección',
                  subTitle: user.direction ?? '',
                ),
                _information(
                  title: 'Fecha de nacimiento',
                  subTitle: user.birthDate?.substring(0, 10) ?? '',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _information({
    required String title,
    required String subTitle,
  }) =>
      Container(
        margin: const EdgeInsets.only(bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              subTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
}
