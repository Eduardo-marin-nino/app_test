import 'package:flutter/material.dart';

class CardFormAuth extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const CardFormAuth({
    Key? key,
    this.margin,
    this.padding,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double paddingBottom = MediaQuery.of(context).padding.bottom;
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: margin,
      padding: padding ?? EdgeInsets.fromLTRB(30, 20, 30, (paddingBottom + 20)),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      alignment: Alignment.centerLeft,
      child: child,
    );
  }
}
