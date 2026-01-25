import 'package:flutter/material.dart' show Color, LinearGradient, Alignment;

abstract class AppColors {
  static const Color primary = Color(0xFF8338E3);

  static const Color secondary = Color(0xFFB84FCE);

  static const Color white = Color(0xFFFFFFFF);

  static const Color orange = Color(0xFFFF930F);

  static const Color yellow = Color(0xFFFFCC39);

  static const Color winner = Color(0xFF9FF15C);

  static const Color blue = Color(0xFF3341FF);

  static const Color playerX = Color(0xFFFF0004);
  static const Color playerO = Color(0xFF1298F8);
  static const Color playerBlocked = Color(0xFFF8B312);
}

abstract class AppGradient {
  static const LinearGradient primary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.primary, AppColors.secondary],
  );

  static const LinearGradient yellowGradient = LinearGradient(colors: [AppColors.orange, AppColors.yellow]);
}
