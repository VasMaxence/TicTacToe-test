import 'board.dart';
import 'player.dart';
import 'difficulty.dart';

class GameState {
  final Board board;
  final Player currentPlayer;
  final Player? winner;
  final bool isDraw;
  final Difficulty difficulty;

  const GameState({required this.board, required this.currentPlayer, required this.difficulty, this.winner, this.isDraw = false});

  factory GameState.initial(Difficulty difficulty, {Player currentPlayer = Player.x}) {
    return GameState(board: Board.fromDifficulty(difficulty), currentPlayer: currentPlayer, difficulty: difficulty);
  }

  bool get isGameOver => winner != null || isDraw;
}
