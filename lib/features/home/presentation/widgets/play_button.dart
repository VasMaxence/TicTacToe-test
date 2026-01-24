import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe_test/core/router/app_router.gr.dart';
import 'package:tictactoe_test/features/game/presentation/controller/game_providers.dart';
import 'package:tictactoe_test/features/home/presentation/controller/home_providers.dart';
import 'package:tictactoe_test/shared/theme/colors.dart';
import 'package:tictactoe_test/shared/theme/test_styles.dart';
import 'package:tictactoe_test/shared/widgets/responsive.dart';

class PlayButton extends ConsumerWidget {
  const PlayButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        ref.invalidate(gameControllerProvider);
        context.router.push(GameRoute(difficulty: ref.read(difficultyProvider)));
      },
      child: Container(
        width: formatWidth(180),
        height: formatHeight(45),
        decoration: BoxDecoration(gradient: AppGradient.yellowGradient, borderRadius: BorderRadius.circular(8)),
        child: Center(child: Text('JOUER', style: AppTextStyles.buttonStyle(23))),
      ),
    );
  }
}
