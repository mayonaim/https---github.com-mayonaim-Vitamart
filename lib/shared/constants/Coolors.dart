import 'package:flutter/material.dart';

class Coolors {
  static Color primary = hexToColor('#2f3d2c');
  static Color secondary = hexToColor('#283618');
  static Color accent = hexToColor('#bc6c25');
  static Color highlight = hexToColor('#dda15e');
  static Color background = hexToColor('#f1ffee');
  static Color grey = hexToColor('#ededed');
  static Color white = hexToColor('#ffffff');
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex));

  return Color(int.parse(hex.substring(1), radix: 16) +
      (hex.length == 7 ? 0xFF000000 : 0x00000000));
}
