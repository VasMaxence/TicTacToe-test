import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe_test/features/game/domain/entities/winning_line.dart';
import 'package:tictactoe_test/features/game/domain/usecases/play_move.dart';
import 'package:tictactoe_test/features/game/domain/usecases/check_winner.dart';
import 'package:tictactoe_test/features/game/domain/entities/game_state.dart';
import 'package:tictactoe_test/features/game/domain/entities/difficulty.dart';
import 'package:tictactoe_test/features/game/domain/entities/player.dart';
import 'package:tictactoe_test/features/game/domain/entities/board.dart';

void main() {
  late PlayMove playMove;

  setUp(() {
    playMove = PlayMove(CheckWinner());
  });

  test('plays a move and switches player when game is not over', () {
    final state = GameState(board: Board.fromDifficulty(Difficulty.easy), currentPlayer: Player.x, difficulty: Difficulty.easy);

    final next = playMove(state, 0);

    expect(next.board[0], Player.x);
    expect(next.currentPlayer, Player.o);
    expect(next.winningLine, isNull);
    expect(next.isDraw, isFalse);
  });

  test('returns same state if game is already over', () {
    final state = GameState(
      board: Board.fromDifficulty(Difficulty.easy),
      currentPlayer: Player.x,
      difficulty: Difficulty.easy,
      winningLine: WinningLine([0, 1, 2], Player.x),
    );

    final next = playMove(state, 1);

    expect(next, state);
  });

  test('detects a win and does not switch player', () {
    final board = Board([Player.x, Player.x, null, null, null, null, null, null, null], size: 3);

    final state = GameState(board: board, currentPlayer: Player.x, difficulty: Difficulty.easy);

    final next = playMove(state, 2);

    expect(next.winningLine, WinningLine([0, 1, 2], Player.x));
    expect(next.currentPlayer, Player.x);
    expect(next.isGameOver, isTrue);
  });

  test('detects a draw when board is full and no winner', () {
    final board = Board([Player.x, Player.o, Player.x, Player.x, Player.o, Player.o, Player.o, Player.x, null], size: 3);

    final state = GameState(board: board, currentPlayer: Player.x, difficulty: Difficulty.easy);

    final next = playMove(state, 8);

    expect(next.isDraw, isTrue);
    expect(next.winningLine, isNull);
    expect(next.isGameOver, isTrue);
  });

  test('returns same state if player plays on an already played cell', () {
    GameState state = GameState(board: Board.fromDifficulty(Difficulty.easy), currentPlayer: Player.x, difficulty: Difficulty.easy);
    state = playMove(state, 0);

    final tmp = playMove(state, 0);

    expect(tmp.board[0], Player.x);
    expect(tmp.currentPlayer, Player.o);
    expect(tmp.winningLine, isNull);
    expect(tmp.isDraw, isFalse);
  });
}
