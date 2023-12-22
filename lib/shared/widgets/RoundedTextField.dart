import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vitamart/shared/constants/Coolors.dart';

class RoundedTextField extends StatelessWidget {
  final String hintText;
  final dynamic icon;
  final bool isHidden;
  final TextEditingController controller;
  final visibility = false.obs;

  RoundedTextField({
    required this.hintText,
    required this.icon,
    required this.isHidden,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Coolors.white,
        ),
        child: Obx(() {
          if (isHidden) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Coolors.grey),
                      prefixIcon: icon,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => visibility.toggle(),
                  icon: FaIcon(
                    visibility.value
                        ? FontAwesomeIcons.eye
                        : FontAwesomeIcons.eyeSlash,
                  ),
                ),
              ],
            );
          } else {
            return TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Coolors.grey),
                prefixIcon: icon,
              ),
            );
          }
        }),
      ),
    );
  }
}
