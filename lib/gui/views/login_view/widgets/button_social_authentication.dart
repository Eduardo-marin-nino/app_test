import 'package:flutter/material.dart';

class ButtonAuthentication extends StatelessWidget {
  const ButtonAuthentication({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: Colors.grey[200]!,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 30,
          color: const Color.fromARGB(255, 18, 183, 134),
        ),
      ),
    );
  }
}
