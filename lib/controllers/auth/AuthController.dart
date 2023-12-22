import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final TextEditingController username = TextEditingController();
  final List<TextInputFormatter> unameRules = [
    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
    FilteringTextInputFormatter.deny(RegExp(r'[a-zA-Z0-9]')),
  ];

  final TextEditingController password = TextEditingController();
  final List<TextInputFormatter> passwRules = [
    FilteringTextInputFormatter.allow(
        RegExp(r'[a-zA-Z0-9@#$%^&*_+=|:<>,.?/~`!-]')),
    FilteringTextInputFormatter.deny(RegExp(r'[a-zA-Z0-9]')),
  ];

  // void validateAndShowSnackbar() {
  //   String? usernameErrorMessage = getUsernameErrorMessage(username.text);
  //   String? passwordErrorMessage = getPasswordErrorMessage(password.text);

  //   if (usernameErrorMessage != null || passwordErrorMessage != null) {
  //     String errorMessage =
  //         'Validation Error\n${usernameErrorMessage}${passwordErrorMessage}';

  //     Get.snackbar(
  //       'Validation Error',
  //       errorMessage.trim(),
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Coolors.white,
  //       colorText: Colors.white,
  //       duration: Duration(seconds: 3),
  //     );
  //   } else {
  //     // Continue with your logic if inputs are valid
  //   }
  // }

  String? getUsernameErrorMessage(String username) {
    // Add specific username validation logic here
    if (username.isEmpty) {
      return 'Username cannot be empty.\n';
    }

    if (RegExp(r'[!@#%^&*(),.?":{}|<>]').hasMatch(username)) {
      return 'Username cannot contain special characters.\n';
    }
    return null;
  }

  String? getPasswordErrorMessage(String password) {
    // Add specific password validation logic here
    if (password.isEmpty) {
      return 'Password cannot be empty.\n';
    }

    if (RegExp(r'[!@#%^&*(),.?":{}|<>]').hasMatch(password)) {
      return 'Password cannot contain special characters.\n';
    }

    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return 'Password must contain at least one uppercase letter.\n';
    }

    if (!RegExp(r'[a-z]').hasMatch(password)) {
      return 'Password must contain at least one lowercase letter.\n';
    }

    if (!RegExp(r'[0-9]').hasMatch(password)) {
      return 'Password must contain at least one digit.\n';
    }

    return null;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
