import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  final Widget icon;
  final Color backgroundColor;
  final VoidCallback onPressed;

  const CircularIconButton({
    required this.icon,
    required this.backgroundColor,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}
