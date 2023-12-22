import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vitamart/shared/constants/Coolors.dart';

class CAppBar extends StatelessWidget {
  final String title;
  final bool includeBackButton;

  const CAppBar({required this.title, required this.includeBackButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      color: Coolors.primary,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          includeBackButton
              ? IconButton(
                  onPressed: () {
                    Get.offAllNamed('/orders');
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Coolors.white,
                    size: 28,
                  ),
                )
              : SizedBox(width: 36),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Coolors.white),
          )
        ],
      ),
    );
  }
}
