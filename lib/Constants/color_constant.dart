import 'package:flutter/material.dart';

class BaseTheme {
  Color get primaryTheme => Colors.black;
  Color get whiteColor => Colors.white;
  Color get secondaryColor => fromHex('#707070');
  Color get GrayColor => fromHex('#E1E1E1');
  Color get textGrayColor => fromHex('#BFBFBF');
  Color get borderColor => fromHex('#B8B8B8');
  Color get fillColor => fromHex('#F5F5F5');
}

BaseTheme get appTheme => BaseTheme();

Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}
