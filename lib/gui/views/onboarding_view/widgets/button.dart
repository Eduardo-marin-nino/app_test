import 'package:flutter/material.dart';

class ButtonOnboarding extends StatelessWidget {
  const ButtonOnboarding({
    Key? key,
    this.colorButton,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  final String label;
  final Color? colorButton;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          label,
          style: TextStyle(
            color: colorButton ?? const Color(0xff262626),
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
