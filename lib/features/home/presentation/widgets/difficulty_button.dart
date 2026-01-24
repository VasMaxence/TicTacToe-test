import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe_test/features/game/domain/entities/difficulty.dart';
import 'package:tictactoe_test/features/home/presentation/controller/home_providers.dart';
import 'package:tictactoe_test/shared/theme/colors.dart';
import 'package:tictactoe_test/shared/theme/test_styles.dart';
import 'package:tictactoe_test/shared/widgets/responsive.dart';

class DifficultyButton extends ConsumerWidget {
  final Difficulty difficulty;

  const DifficultyButton({super.key, required this.difficulty});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(difficultyProvider) == difficulty;

    const difficultyColors = {Difficulty.easy: Color(0xFF1EB92D), Difficulty.medium: Color(0xFFD4BA27), Difficulty.hard: Color(0xFFD85521)};

    return InkWell(
      onTap: () {
        ref.read(difficultyProvider.notifier).state = difficulty;
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: formatWidth(180),
        height: formatHeight(45),
        decoration: BoxDecoration(
          color: selected ? difficultyColors[difficulty] : AppColors.white.withValues(alpha: .25),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: difficultyColors[difficulty]!, width: 1),
        ),
        child: Center(child: Text(difficulty.name.toUpperCase(), style: AppTextStyles.buttonStyle(18))),
      ),
    );
  }
}
