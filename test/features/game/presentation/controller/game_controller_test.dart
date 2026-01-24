import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe_test/features/game/domain/entities/player.dart';
import 'package:tictactoe_test/features/game/presentation/controller/game_controller.dart';
import 'package:tictactoe_test/features/game/presentation/controller/game_providers.dart';
import 'package:tictactoe_test/features/game/domain/entities/difficulty.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer(
      overrides: [
        gameControllerProvider.overrideWith((ref) {
          final playMove = ref.watch(playMoveProvider);
          return GameController(playMove: playMove, difficulty: Difficulty.easy);
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
