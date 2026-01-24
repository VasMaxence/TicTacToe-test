import 'package:tictactoe_test/features/game/domain/entities/winning_line.dart';

import 'board.dart';
import 'player.dart';
import 'difficulty.dart';

class GameState {
  final Board board;
  final Player currentPlayer;
  final bool isDraw;
  final Difficulty difficulty;
  final WinningLine? winningLine;

  const GameState({required this.board, required this.currentPlayer, required this.difficulty, this.isDraw = false, this.winningLine});

  factory GameState.initial(Difficulty difficulty, {Player currentPlayer = Player.x}) {
    return GameState(board: Board.fromDifficulty(difficulty), currentPlayer: currentPlayer, difficulty: difficulty);
  }

  bool get isGameOver => winningLine != null || isDraw;
}
