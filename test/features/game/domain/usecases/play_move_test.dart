import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe_test/features/game/domain/entities/board.dart';
import 'package:tictactoe_test/features/game/domain/entities/difficulty.dart';
import 'package:tictactoe_test/features/game/domain/entities/game_mode.dart';
import 'package:tictactoe_test/features/game/domain/entities/game_state.dart';
import 'package:tictactoe_test/features/game/domain/entities/player.dart';
import 'package:tictactoe_test/features/game/domain/entities/winning_line.dart';
import 'package:tictactoe_test/features/game/domain/usecases/check_winner.dart';
import 'package:tictactoe_test/features/game/domain/usecases/play_move.dart';

void main() {
  group('PlayMove Use Case', () {
    late PlayMove playMove;
    late CheckWinner checkWinner;

    setUp(() {
      checkWinner = CheckWinner();
      playMove = PlayMove(checkWinner);
    });

    test('should update board and switch player', () {
      final board = Board(List.filled(9, null), size: 3);
      final initialState = GameState(
        board: board,
        currentPlayer: Player.x,
        difficulty: Difficulty.easy,
        gameMode: GameMode.pvp,
      );

      final result = playMove(initialState, 0);

      expect(result.board[0], Player.x);
      expect(result.currentPlayer, Player.o);
      expect(result.isGameOver, isFalse);
    });

    test('should identify winner', () {
      final board = Board([Player.x, Player.x, null, null, null, null, null, null, null], size: 3);
      final state = GameState(
        board: board,
        currentPlayer: Player.x,
        difficulty: Difficulty.easy,
        gameMode: GameMode.pvp,
      );

      final result = playMove(state, 2);

      expect(result.winningLine, isNotNull);
      expect(result.winningLine?.player, Player.x);
      expect(result.winningLine?.indexes, [0, 1, 2]);
    });

    test('should identify draw', () {
      final board = Board([
        Player.x,
        Player.o,
        Player.x,
        Player.x,
        Player.o,
        Player.o,
        Player.o,
        Player.x,
        null,
      ], size: 3);
      final state = GameState(
        board: board,
        currentPlayer: Player.x,
        difficulty: Difficulty.easy,
        gameMode: GameMode.pvp,
      );

      final result = playMove(state, 8);

      expect(result.isDraw, isTrue);
      expect(result.winningLine, isNull);
    });

    test('should return same state if game already over', () {
      final board = Board(List.filled(9, null), size: 3);
      final state = GameState(
        board: board,
        currentPlayer: Player.x,
        difficulty: Difficulty.easy,
        gameMode: GameMode.pvp,
        winningLine: const WinningLine([0, 1, 2], Player.x),
      );

      final result = playMove(state, 4);

      expect(result, state);
    });

    test('should return same state if position already taken', () {
      final board = Board([Player.o, null, null, null, null, null, null, null, null], size: 3);
      final state = GameState(
        board: board,
        currentPlayer: Player.x,
        difficulty: Difficulty.easy,
        gameMode: GameMode.pvp,
      );

      final result = playMove(state, 0);

      expect(result, state);
    });
  });
}
