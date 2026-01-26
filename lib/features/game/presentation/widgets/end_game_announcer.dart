import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe_test/core/utils/utils.dart';
import 'package:tictactoe_test/features/game/domain/entities/game_mode.dart';
import 'package:tictactoe_test/features/game/domain/entities/player.dart';
import 'package:tictactoe_test/features/game/presentation/controller/game_providers.dart';
import 'package:tictactoe_test/shared/theme/colors.dart';
import 'package:tictactoe_test/shared/theme/test_styles.dart';
import 'package:easy_localization/easy_localization.dart';

class EndGameAnnouncer extends ConsumerWidget {
  const EndGameAnnouncer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gameControllerProvider);
    final gameResult = state.winningLine;
    final isAI = state.gameMode == GameMode.ai;

    if (gameResult == null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("game.nice_game".tr(), style: AppTextStyles.defaultStyle(AppColors.white, 24).copyWith(height: 1)),
          Stack(
            children: [
              Text(
                "game.draw".tr(),
                textAlign: TextAlign.center,
                style: AppTextStyles.defaultStyle(AppColors.blue, 55).copyWith(
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2
                    ..color = Colors.white,
                  height: 1,
                ),
              ),
              Text("game.draw".tr(), style: AppTextStyles.defaultStyle(AppColors.blue, 55).copyWith(height: 1)),
            ],
          ),
        ],
      );
    }

    final Color color = {
      Player.x: Color(0xFFFF0004),
      Player.o: Color(0xFF1298F8),
      Player.i: Color(0xFFF8B312),
    }[gameResult.player]!;

    String winnerTitle;
    String winnerName;

    if (isAI) {
      winnerTitle = "game.nice_game".tr();
      winnerName = (gameResult.player == Player.x) ? "game.you_win".tr() : "game.ai_wins".tr();
    } else {
      winnerTitle = "game.winner_is".tr();
      winnerName = "game.player".tr(args: [enumToString(gameResult.player).toUpperCase()]);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(winnerTitle, style: AppTextStyles.defaultStyle(AppColors.white, 24).copyWith(height: 1)),
        Stack(
          children: [
            Text(
              winnerName,
              textAlign: TextAlign.center,
              style: AppTextStyles.defaultStyle(AppColors.blue, 55).copyWith(
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 3
                  ..color = Colors.white,
                height: 1,
              ),
            ),
            Text(
              winnerName,
              style: AppTextStyles.defaultStyle(color, 55).copyWith(height: 1),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}
