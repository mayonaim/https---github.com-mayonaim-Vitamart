import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vitamart/shared/constants/Coolors.dart';

class Counter extends StatelessWidget {
  final VoidCallback increment;
  final VoidCallback decrement;
  final TextEditingController quantityController;
  final double size;

  Counter({
    required this.increment,
    required this.decrement,
    required this.quantityController,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final iconSize = size * 0.8;
    final space = size * 0.5;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Coolors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: decrement,
              icon: FaIcon(
                FontAwesomeIcons.minus,
                color: Coolors.primary,
                size: iconSize,
              ),
            ),
          ),
          SizedBox(width: space),
          Text(
            quantityController.text,
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: Coolors.white, fontSize: size),
          ),
          SizedBox(width: space),
          Container(
            decoration: BoxDecoration(
              color: Coolors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: increment,
              icon: FaIcon(
                FontAwesomeIcons.plus,
                color: Coolors.primary,
                size: iconSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
