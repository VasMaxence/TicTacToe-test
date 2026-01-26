import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tictactoe_test/core/router/app_router.gr.dart';
import 'package:tictactoe_test/features/game/domain/entities/difficulty.dart';
import 'package:tictactoe_test/features/game/domain/entities/game_mode.dart';
import 'package:tictactoe_test/features/home/presentation/widgets/difficulty_button.dart';
import 'package:tictactoe_test/features/home/presentation/widgets/game_mode_button.dart';
import 'package:tictactoe_test/features/home/presentation/widgets/starting_player_selector.dart';
import 'package:tictactoe_test/features/home/presentation/widgets/play_button.dart';
import 'package:tictactoe_test/features/home/presentation/widgets/show_history_button.dart';
import 'package:tictactoe_test/shared/theme/colors.dart';
import 'package:tictactoe_test/features/home/presentation/controller/home_providers.dart';
import 'package:tictactoe_test/shared/widgets/responsive.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  static const routeName = '/home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(gradient: AppGradient.primary),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                sh(12),
                Image.asset("assets/image/appLogo.png", height: formatHeight(170)),
                sh(12),

                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (final mode in GameMode.values) ...[
                            GameModeButton(mode: mode),
                            if (mode != GameMode.values.last) sw(8),
                          ],
                        ],
                      ),
                      sh(12),
                      if (ref.watch(gameModeProvider) == GameMode.ai) ...[const StartingPlayerSelector(), sh(20)],
                      for (final difficulty in Difficulty.values) ...[DifficultyButton(difficulty: difficulty), sh(6)],
                      sh(12),
                      const PlayButton(),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: formatHeight(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        sw(8),
                        Align(alignment: Alignment.bottomCenter, child: const ShowHistoryButton()),
                        sw(8),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: InkWell(
                              onTap: () => context.router.push(const SettingsRoute()),
                              child: Padding(
                                padding: pwh(27, 8),
                                child: SvgPicture.asset(
                                  "assets/icons/ic_settings.svg",
                                  width: formatWidth(24),
                                  height: formatHeight(24),
                                  colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
