import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe_test/features/game/domain/entities/difficulty.dart';
import 'package:tictactoe_test/features/game/domain/entities/game_mode.dart';
import 'package:tictactoe_test/features/game/domain/entities/player.dart';
import 'package:tictactoe_test/features/game/presentation/controller/game_controller.dart';
import 'package:tictactoe_test/features/game/presentation/controller/game_providers.dart';

void main() {
  late ProviderContainer container;

  setUp(() async {
    container = ProviderContainer(
      overrides: [
        gameControllerProvider.overrideWith((ref) {
          final playMove = ref.watch(playMoveProvider);
          final getAIMove = ref.watch(getAIMoveProvider);
          return GameController(
            playMove: playMove,
            getAIMove: getAIMove,
            saveScoreUseCase: null,
            difficulty: Difficulty.easy,
            gameMode: GameMode.pvp,
            startingPlayer: Player.x,
          );
        }),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  test('initial state is empty board with player X', () {
    final state = container.read(gameControllerProvider);

    expect(state.board.cells.every((c) => c == null), isTrue);
    expect(state.currentPlayer, Player.x);
    expect(state.winningLine, isNull);
    expect(state.isDraw, isFalse);
    expect(state.gameMode, GameMode.pvp);
  });

  test('play() updates board and switches player', () {
    final notifier = container.read(gameControllerProvider.notifier);

    notifier.play(0);

    final state = container.read(gameControllerProvider);

    expect(state.board[0], Player.x);
    expect(state.currentPlayer, Player.o);
  });

  test('reset() resets the game state', () {
    final notifier = container.read(gameControllerProvider.notifier);

    notifier.play(0);
    notifier.reset();

    final state = container.read(gameControllerProvider);

    expect(state.board.cells.every((c) => c == null), isTrue);
    expect(state.currentPlayer, Player.x);
    expect(state.winningLine, isNull);
  });
}
