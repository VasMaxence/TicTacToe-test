import '../entities/game_state.dart';
import 'check_winner.dart';

class PlayMove {
  final CheckWinner checkWinner;

  PlayMove(this.checkWinner);

  GameState call(GameState state, int index) {
    if (state.isGameOver) return state;

    final newBoard = state.board.play(index, state.currentPlayer);
    if (newBoard == state.board) return state;
    final winningLine = checkWinner(cells: newBoard.cells, boardSize: newBoard.size, winLength: 3);

    if (winningLine != null) {
      return GameState(board: newBoard, currentPlayer: state.currentPlayer, difficulty: state.difficulty, winningLine: winningLine);
    }

    if (newBoard.isFull) {
      return GameState(board: newBoard, currentPlayer: state.currentPlayer, difficulty: state.difficulty, isDraw: true);
    }

    return GameState(board: newBoard, currentPlayer: state.currentPlayer.opponent, difficulty: state.difficulty);
  }
}
