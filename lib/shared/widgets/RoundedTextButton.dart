import 'package:flutter/material.dart';
import 'package:vitamart/shared/constants/Coolors.dart';

class RoundedTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? px;
  final double? py;
  final String text;
  final TextStyle? style;

  const RoundedTextButton({
    Key? key,
    required this.onPressed,
    this.backgroundColor,
    this.borderColor,
    this.px,
    this.py,
    required this.text,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding:
            EdgeInsets.symmetric(horizontal: px ?? 20.0, vertical: py ?? 15.0),
        backgroundColor: backgroundColor ?? Coolors.primary,
        shape: RoundedRectangleBorder(
          side:
              BorderSide(color: borderColor ?? Colors.transparent, width: 1.25),
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      child: Text(
        text,
        style: style ??
            Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: Coolors.grey),
      ),
    );
  }
}
