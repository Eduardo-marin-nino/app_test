import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Sliders extends StatelessWidget {
  const Sliders({
    Key? key,
    required this.sliders,
    required this.currentPage,
    required this.pageController,
  }) : super(key: key);

  final double currentPage;
  final PageController pageController;
  final List<Map<String, String>> sliders;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      child: PageView(
        controller: pageController,
        children: List.generate(
          sliders.length,
          (index) {
            final Map<String, String> item = sliders[index];
            final double progress = (index - currentPage);
            final double scale = lerpDouble(.9, .5, progress.abs())!;

            return Transform(
              alignment: Alignment.bottomCenter,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 00.1)
                ..scale(scale, scale),
              child: SvgPicture.asset(
                item['image']!,
                alignment: Alignment.bottomCenter,
              ),
            );
          },
        ),
      ),
    );
  }
}
