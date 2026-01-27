import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe_test/features/game/presentation/controller/game_providers.dart';
import 'package:tictactoe_test/shared/theme/colors.dart';
import 'package:tictactoe_test/shared/theme/test_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tictactoe_test/shared/widgets/responsive.dart';

class NewGameButton extends ConsumerWidget {
  final VoidCallback? onTap;

  const NewGameButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        ref.read(gameControllerProvider.notifier).reset();
        onTap?.call();
      },
      child: Container(
        width: formatWidth(180),
        height: formatHeight(45),
        decoration: BoxDecoration(gradient: AppGradient.yellowGradient, borderRadius: BorderRadius.circular(8)),
        child: Center(child: Text('game.restart'.tr().toUpperCase(), style: AppTextStyles.buttonStyle(23))),
      ),
    );
  }
}
