import 'package:flutter/material.dart' show Color, LinearGradient;

abstract class AppColors {
  static const Color primary = Color(0xFF8338E3);

  static const Color secondary = Color(0xFFB84FCE);

  static const Color white = Color(0xFFFFFFFF);

  static const Color orange = Color(0xFFFF930F);

  static const Color yellow = Color(0xFFFFF95B);
}

abstract class AppGradient {
  static const LinearGradient primary = LinearGradient(colors: [AppColors.primary, AppColors.secondary]);

  static const LinearGradient textGradient = LinearGradient(colors: [AppColors.orange, AppColors.yellow]);
}
