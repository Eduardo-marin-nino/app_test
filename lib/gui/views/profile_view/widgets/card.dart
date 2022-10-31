import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    this.width,
    this.margin,
    this.padding,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        color: Colors.grey[50],
        border: Border.all(
          color: Colors.grey[300]!,
        ),
      ),
      child: child,
    );
  }
}
