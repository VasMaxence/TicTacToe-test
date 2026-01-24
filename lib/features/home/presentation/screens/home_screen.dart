import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe_test/features/game/domain/entities/difficulty.dart';
import 'package:tictactoe_test/features/home/presentation/widgets/difficulty_button.dart';
import 'package:tictactoe_test/features/home/presentation/widgets/play_button.dart';
import 'package:tictactoe_test/shared/theme/colors.dart';
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
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (final difficulty in Difficulty.values) ...[DifficultyButton(difficulty: difficulty), sh(6)],
                        sh(6),
                        PlayButton(),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/**
 * Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Choose difficulty', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 24),
            for (final difficulty in Difficulty.values)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ElevatedButton(
                  onPressed: () {
                    ref.invalidate(gameControllerProvider);

                    context.router.navigate(GameRoute(difficulty: difficulty));
                  },
                  child: Text(difficulty.name.toUpperCase()),
                ),
              ),
          ],
        ),
      )
 */
