import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe_test/features/game/presentation/controller/game_providers.dart';
import 'package:tictactoe_test/features/game/presentation/widgets/player_text.dart';
import 'package:tictactoe_test/shared/theme/colors.dart';
import 'package:tictactoe_test/shared/theme/test_styles.dart';

class PlayerTurn extends ConsumerWidget {
  const PlayerTurn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerTurn = ref.watch(gameControllerProvider).currentPlayer;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("C'est au tour de", style: AppTextStyles.defaultStyle(AppColors.white, 24).copyWith(height: 1)),
        PlayerText(player: playerTurn, fontSize: 120, height: 1),
      ],
    );
  }
}
