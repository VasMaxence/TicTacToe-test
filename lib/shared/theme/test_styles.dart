import 'package:flutter/material.dart' show TextStyle, Color, FontWeight, TextDecoration;
import 'package:tictactoe_test/shared/theme/colors.dart';
import 'package:tictactoe_test/shared/widgets/responsive.dart' show sp;

abstract class AppTextStyles {
  static TextStyle defaultStyle(Color color, double fontSize, {FontWeight weight = FontWeight.w400, TextDecoration? decoration}) =>
      TextStyle(color: color, fontSize: sp(fontSize), fontWeight: weight, decoration: decoration, fontFamily: "Joyful");

  static TextStyle buttonStyle(double fontSize, {FontWeight weight = FontWeight.w400, TextDecoration? decoration}) =>
      defaultStyle(AppColors.white, fontSize, weight: weight, decoration: decoration);
}
