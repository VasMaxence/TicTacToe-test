import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe_test/features/game/domain/entities/game_mode.dart';
import 'package:tictactoe_test/features/home/presentation/controller/home_providers.dart';
import 'package:tictactoe_test/shared/theme/colors.dart';
import 'package:tictactoe_test/shared/theme/test_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tictactoe_test/shared/widgets/responsive.dart';

class GameModeButton extends ConsumerWidget {
  final GameMode mode;

  const GameModeButton({super.key, required this.mode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(gameModeProvider) == mode;

    return InkWell(
      onTap: () {
        ref.read(gameModeProvider.notifier).state = mode;
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: formatWidth(120),
        height: formatHeight(45),
        decoration: BoxDecoration(
          color: selected ? AppColors.white.withValues(alpha: .5) : AppColors.white.withValues(alpha: .15),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.white.withValues(alpha: .4), width: 1),
        ),
        child: Center(child: Text('game_mode.${mode.name}'.tr().toUpperCase(), style: AppTextStyles.buttonStyle(16))),
      ),
    );
  }
}
