import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    this.width,
    this.onTap,
    this.margin,
    this.leading,
    this.padding,
    this.fontSize,
    this.textStyle,
    this.fontWeight,
    this.height = 50,
    this.borderColor,
    this.enabled = true,
    this.backgroundColor,
    required this.label,
  }) : super(key: key);

  final bool enabled;
  final String label;
  final double? width;
  final double? height;
  final Function? onTap;
  final Widget? leading;
  final double? fontSize;
  final Color? borderColor;
  final TextStyle? textStyle;
  final FontWeight? fontWeight;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: () {
          if (enabled) {
            onTap?.call();
          }
        },
        child: Container(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 0),
          alignment: Alignment.center,
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: _validateEnabled(context),
            borderRadius: BorderRadius.circular(15),
            border:
                borderColor != null ? Border.all(color: borderColor!) : null,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (leading != null) leading!,
              if (leading != null) const SizedBox(width: 20),
              Text(
                label,
                style: textStyle ??
                    TextStyle(
                      fontSize: fontSize ?? 18,
                      color: Colors.white,
                      fontWeight: fontWeight ?? FontWeight.w800,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color? _validateEnabled(BuildContext context) {
    return enabled
        ? backgroundColor ?? Theme.of(context).primaryColor
        : Colors.grey[300];
  }
}
