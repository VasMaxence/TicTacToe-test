import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe_test/features/game/domain/entities/player.dart';
import 'package:tictactoe_test/features/game/presentation/widgets/player_text.dart';
import 'package:tictactoe_test/features/home/presentation/controller/home_providers.dart';
import 'package:tictactoe_test/shared/theme/colors.dart';
import 'package:tictactoe_test/shared/theme/test_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tictactoe_test/shared/widgets/responsive.dart';

class StartingPlayerSelector extends ConsumerWidget {
  const StartingPlayerSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startingPlayer = ref.watch(startingPlayerProvider);

    return Column(
      children: [
        Text(
          "home.starting_player".tr().toUpperCase(),
          style: AppTextStyles.bodyStyle(
            14,
          ).copyWith(color: AppColors.white.withValues(alpha: .7), fontWeight: FontWeight.bold),
        ),
        sh(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _PlayerOption(player: Player.x, isSelected: startingPlayer == Player.x),
            sw(16),
            _PlayerOption(player: Player.o, isSelected: startingPlayer == Player.o),
          ],
        ),
      ],
    );
  }
}

class _PlayerOption extends ConsumerWidget {
  final Player player;
  final bool isSelected;

  const _PlayerOption({required this.player, required this.isSelected});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => ref.read(startingPlayerProvider.notifier).state = player,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: formatWidth(110),
        height: formatHeight(45),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.white.withValues(alpha: .5) : AppColors.white.withValues(alpha: .15),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.white.withValues(alpha: .4), width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PlayerText(player: player, fontSize: 32, height: 1),
            sw(8),
            Text(player == Player.x ? "home.you".tr() : "home.ai".tr(), style: AppTextStyles.buttonStyle(16)),
          ],
        ),
      ),
    );
  }
}
