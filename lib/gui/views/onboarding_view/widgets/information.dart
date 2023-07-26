import 'package:flutter/material.dart';

class InformationOnboarding extends StatelessWidget {
  const InformationOnboarding({
    Key? key,
    required this.label,
    required this.description,
  }) : super(key: key);

  final String label;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          key: Key(label),
          children: [
            _title(),
            const SizedBox(height: 15),
            _desciption(),
          ],
        ),
      ),
    );
  }

  Widget _title() => Text(
        label,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 24,
          color: Colors.black,
          fontWeight: FontWeight.w800,
        ),
      );

  Widget _desciption() => Text(
        description,
        textAlign: TextAlign.justify,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xff262626),
        ),
      );
}
