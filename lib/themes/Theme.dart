import 'package:flutter/material.dart';
import 'package:vitamart/shared/constants/Coolors.dart';
import 'package:vitamart/themes/TextTheme.dart';

class Themes {
  static ThemeData vTheme = ThemeData(
    primaryColor: Coolors.primary,
    scaffoldBackgroundColor: Coolors.background.withOpacity(0.66),
    textTheme: vTextTheme,
  );
}
