import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe_test/features/game/domain/entities/game_mode.dart';
import 'package:tictactoe_test/features/game/domain/entities/player.dart';
import 'package:tictactoe_test/features/game/presentation/controller/game_providers.dart';
import 'package:tictactoe_test/core/utils/utils.dart';
import 'package:tictactoe_test/features/game/presentation/widgets/player_text.dart';
import 'package:tictactoe_test/shared/theme/colors.dart';
import 'package:tictactoe_test/shared/theme/test_styles.dart';
import 'package:easy_localization/easy_localization.dart';

class PlayerTurn extends ConsumerWidget {
  const PlayerTurn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gameControllerProvider);
    final playerTurn = state.currentPlayer;
    final isAI = state.gameMode == GameMode.ai;

    String turnText;
    if (isAI) {
      turnText = (playerTurn == Player.x) ? "game.your_turn".tr() : "game.ai_playing".tr();
    } else {
      turnText = "game.turn".tr(args: [enumToString(playerTurn).toUpperCase()]);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(turnText, style: AppTextStyles.defaultStyle(AppColors.white, 24).copyWith(height: 1)),
        PlayerText(player: playerTurn, fontSize: 120, height: 1),
      ],
    );
  }
}
