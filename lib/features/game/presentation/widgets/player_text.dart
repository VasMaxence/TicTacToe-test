import 'package:flutter/material.dart';
import 'package:tictactoe_test/core/utils/utils.dart';
import 'package:tictactoe_test/features/game/domain/entities/player.dart';
import 'package:tictactoe_test/shared/theme/colors.dart';
import 'package:tictactoe_test/shared/theme/test_styles.dart';

class PlayerText extends StatelessWidget {
  final Player player;
  final double fontSize;
  final double height;

  const PlayerText({super.key, required this.player, this.fontSize = 120, this.height = 1});

  @override
  Widget build(BuildContext context) {
    final Color color = {
      Player.x: AppColors.playerX,
      Player.o: AppColors.playerO,
      Player.i: AppColors.playerBlocked,
    }[player]!;

    return Stack(
      children: [
        Text(
          enumToString(player).toUpperCase(),
          style: AppTextStyles.defaultStyle(color, fontSize).copyWith(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 2
              ..color = AppColors.white,
            height: height,
          ),
        ),
        Text(
          enumToString(player).toUpperCase(),
          style: AppTextStyles.defaultStyle(color, fontSize).copyWith(height: height),
        ),
      ],
    );
  }
}
