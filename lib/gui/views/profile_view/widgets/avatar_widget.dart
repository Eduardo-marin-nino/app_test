import 'package:flutter/material.dart';

class AvatarProfile extends StatelessWidget {
  const AvatarProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 90,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: _iconPhoto(),
    );
  }

  Widget _iconPhoto() => const Icon(
        Icons.person,
        size: 46,
        color: Colors.grey,
      );
}
