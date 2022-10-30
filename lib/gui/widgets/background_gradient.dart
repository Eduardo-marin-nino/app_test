import 'package:flutter/material.dart';
import 'package:app_test/core/paths/local_paths.dart';

class BackGroundGradient extends StatelessWidget {
  final Widget child;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;

  const BackGroundGradient({
    Key? key,
    this.padding,
    this.physics,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            LocalPaths.gradientBackground,
          ),
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
        ),
      ),
      child: SingleChildScrollView(
        padding: padding,
        physics: physics,
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: child,
        ),
      ),
    );
  }
}
