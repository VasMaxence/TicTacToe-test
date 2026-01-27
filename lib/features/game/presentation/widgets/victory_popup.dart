import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:tictactoe_test/core/constant/lottie.dart';
import 'package:tictactoe_test/features/game/presentation/widgets/end_game_announcer.dart';
import 'package:tictactoe_test/features/game/presentation/widgets/new_game_button.dart';
import 'package:tictactoe_test/shared/theme/colors.dart';
import 'package:tictactoe_test/shared/widgets/responsive.dart';

class VictoryPopup extends ConsumerWidget {
  const VictoryPopup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(maxWidth: formatWidth(320)),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: formatWidth(360),
              padding: pw(24).add(EdgeInsetsGeometry.only(top: formatHeight(60), bottom: formatHeight(40))),
              decoration: BoxDecoration(
                color: AppColors.primary,
                border: Border.all(color: AppColors.white, width: 2),
                borderRadius: BorderRadius.circular(r(12)),
                boxShadow: [
                  BoxShadow(color: Colors.black.withValues(alpha: .2), blurRadius: 10, offset: const Offset(0, 5)),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  sh(40),
                  const EndGameAnnouncer(),
                  sh(32),
                  NewGameButton(onTap: () => context.router.pop()),
                ],
              ),
            ),
            Positioned(top: -140, child: Lottie.asset(LottieFile.trophy, width: formatWidth(260), repeat: false)),
          ],
        ),
      ),
    );
  }
}
