import 'package:flutter/material.dart';

class PaginationCarousel extends StatelessWidget {
  const PaginationCarousel({
    Key? key,
    required this.quantity,
    required this.currentPage,
    this.colorSelectIndicator,
    this.colorUnSelectIndicator,
    this.sizeSelectIndicator = 10,
    this.sizeUnSelectIndicator = 9,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  }) : super(key: key);

  final int quantity;
  final int currentPage;
  final Color? colorSelectIndicator;
  final Color? colorUnSelectIndicator;
  final double? sizeSelectIndicator;
  final double? sizeUnSelectIndicator;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment!,
      crossAxisAlignment: crossAxisAlignment!,
      children: List.generate(
        quantity,
        (index) => Container(
          margin: const EdgeInsets.only(right: 4),
          child: _indicator(
            index: index,
            color: _colorIndicator(context: context, index: index),
            size: currentPage == index
                ? sizeSelectIndicator!
                : sizeUnSelectIndicator!,
          ),
        ),
      ),
    );
  }

  Widget _indicator({
    required Color? color,
    required double size,
    required int index,
  }) =>
      Container(
        width: size,
        height: 10,
        decoration: BoxDecoration(
          borderRadius: currentPage == index ? BorderRadius.circular(25) : null,
          color: color,
          shape: currentPage == index ? BoxShape.rectangle : BoxShape.circle,
        ),
      );

  Color? _colorIndicator({
    required BuildContext context,
    required int index,
  }) {
    Color? colorSelectIndicatorScope =
        colorSelectIndicator ?? const Color(0xff262626);
    Color? colorUnSelectIndicatorScope =
        colorUnSelectIndicator ?? const Color(0xffA9A9A9);
    if (currentPage == index) {
      return colorSelectIndicatorScope;
    }
    return colorUnSelectIndicatorScope;
  }
}
