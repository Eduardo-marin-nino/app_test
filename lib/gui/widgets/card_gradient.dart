import 'package:flutter/material.dart';

class CardGradient extends StatelessWidget {
  const CardGradient({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(3, 0.0),
          end: Alignment.centerLeft,
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
          ],
        ),
      ),
      child: child,
    );
  }
}
