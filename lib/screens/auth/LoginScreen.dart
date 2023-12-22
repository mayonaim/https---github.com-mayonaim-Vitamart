import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vitamart/controllers/auth/AuthController.dart';
import 'package:vitamart/shared/widgets/RoundedTextField.dart';

class LoginScreen extends GetView<AuthController> {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('asset/images/logo.png'),
          RoundedTextField(
            hintText: 'Username',
            icon: FaIcon(FontAwesomeIcons.user),
            isHidden: false,
            controller: controller.username,
          ),
          RoundedTextField(
            hintText: 'Password',
            icon: FaIcon(FontAwesomeIcons.lock),
            isHidden: true,
            controller: controller.password,
          )
        ],
      ),
    );
  }
}
