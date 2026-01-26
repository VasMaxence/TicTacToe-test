import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tictactoe_test/features/game/domain/entities/player.dart';
import 'package:tictactoe_test/features/game/domain/entities/difficulty.dart';
import 'package:tictactoe_test/features/game/domain/entities/game_mode.dart';
import 'package:tictactoe_test/features/game/presentation/controller/game_controller.dart';
import 'package:tictactoe_test/features/game/presentation/controller/game_providers.dart';
import 'package:tictactoe_test/features/game/presentation/widgets/end_game_announcer.dart';
import 'package:tictactoe_test/features/game/presentation/widgets/game_board.dart';
import 'package:tictactoe_test/features/game/presentation/widgets/new_game_button.dart';
import 'package:tictactoe_test/features/game/presentation/widgets/player_turn.dart';
import 'package:tictactoe_test/features/score_history/domain/providers/score_usecases_providers.dart';
import 'package:tictactoe_test/shared/theme/colors.dart';
import 'package:tictactoe_test/shared/widgets/responsive.dart';

@RoutePage()
class GameScreen extends ConsumerWidget {
  static const routeName = '/game-screen';

  final Difficulty difficulty;
  final GameMode gameMode;
  final Player startingPlayer;

  const GameScreen({super.key, required this.difficulty, required this.gameMode, required this.startingPlayer});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controllerProvider = gameControllerProvider.overrideWith((ref) {
      final playMove = ref.watch(playMoveProvider);
      final getAIMove = ref.watch(getAIMoveProvider);
      final saveScore = ref.watch(saveScoreProvider);

      return GameController(
        playMove: playMove,
        getAIMove: getAIMove,
        saveScoreUseCase: saveScore,
        difficulty: difficulty,
        gameMode: gameMode,
        startingPlayer: startingPlayer,
      );
    });

    return ProviderScope(overrides: [controllerProvider], child: const _GameView());
  }
}

class _GameView extends ConsumerWidget {
  const _GameView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gameControllerProvider);

    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(gradient: AppGradient.primary),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                sh(12),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          ref.read(gameControllerProvider.notifier).reset();
                          context.router.pop();
                        },
                        child: Padding(
                          padding: pwh(14, 8),
                          child: SvgPicture.asset(
                            'assets/icons/ic_back.svg',
                            colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                            width: formatWidth(24),
                          ),
                        ),
                      ),
                      Expanded(child: state.isGameOver ? const EndGameAnnouncer() : const PlayerTurn()),
                      InkWell(
                        onTap: () {
                          ref.read(gameControllerProvider.notifier).reset();
                        },
                        child: Padding(
                          padding: pwh(14, 8),
                          child: SvgPicture.asset(
                            'assets/icons/ic_refresh.svg',
                            colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                            width: formatWidth(24),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                sh(12),
                Expanded(
                  flex: 2,
                  child: Center(child: GameBoard(state: state)),
                ),
                Expanded(
                  child: state.isGameOver
                      ? const Align(alignment: Alignment.bottomCenter, child: NewGameButton())
                      : const SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
