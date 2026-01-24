import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe_test/core/utils/utils.dart';
import 'package:tictactoe_test/features/game/domain/entities/player.dart';
import 'package:tictactoe_test/features/game/presentation/controller/game_providers.dart';
import 'package:tictactoe_test/shared/theme/colors.dart';
import 'package:tictactoe_test/shared/theme/test_styles.dart';

class EndGameAnnouncer extends ConsumerWidget {
  const EndGameAnnouncer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameResult = ref.watch(gameControllerProvider).winningLine;

    if (gameResult == null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("C'était une belle partie !", style: AppTextStyles.defaultStyle(AppColors.white, 24).copyWith(height: 1)),
          Stack(
            children: [
              Text(
                "Match Nul",
                textAlign: TextAlign.center,
                style: AppTextStyles.defaultStyle(AppColors.blue, 55).copyWith(
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2
                    ..color = Colors.white,
                  height: 1,
                ),
              ),
              Text("Match Nul", style: AppTextStyles.defaultStyle(AppColors.blue, 55).copyWith(height: 1)),
            ],
          ),
        ],
      );
    }

    final Color color = {Player.x: Color(0xFFFF0004), Player.o: Color(0xFF1298F8), Player.i: Color(0xFFF8B312)}[gameResult.player]!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Le gagnant est", style: AppTextStyles.defaultStyle(AppColors.white, 24).copyWith(height: 1)),
        Stack(
          children: [
            Text(
              "Joueur ${enumToString(gameResult.player).toUpperCase()}",
              textAlign: TextAlign.center,
              style: AppTextStyles.defaultStyle(AppColors.blue, 55).copyWith(
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 2
                  ..color = Colors.white,
                height: 1,
              ),
            ),
            Text("Joueur ${enumToString(gameResult.player).toUpperCase()}", style: AppTextStyles.defaultStyle(color, 55).copyWith(height: 1)),
          ],
        ),
      ],
    );
  }
}
