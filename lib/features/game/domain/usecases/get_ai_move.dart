import 'dart:math';
import '../entities/board.dart';
import '../entities/difficulty.dart';
import '../entities/player.dart';
import 'check_winner.dart';

class GetAIMove {
  final CheckWinner checkWinner;

  GetAIMove(this.checkWinner);

  int call({required Board board, required Difficulty difficulty, required Player aiPlayer}) {
    final availableMoves = _getAvailableMoves(board);
    if (availableMoves.isEmpty) return -1;

    switch (difficulty) {
      case Difficulty.easy:
        return _getRandomMove(availableMoves);
      case Difficulty.medium:
        return _getMinimaxMove(board, aiPlayer, maxDepth: 2);
      case Difficulty.hard:
        return _getMinimaxMove(board, aiPlayer, maxDepth: 4);
    }
  }

  List<int> _getAvailableMoves(Board board) {
    final moves = <int>[];
    for (var i = 0; i < board.cells.length; i++) {
      if (board.cells[i] == null) {
        moves.add(i);
      }
    }
    return moves;
  }

  int _getRandomMove(List<int> availableMoves) {
    return availableMoves[Random().nextInt(availableMoves.length)];
  }

  int _getMinimaxMove(Board board, Player aiPlayer, {required int maxDepth}) {
    int bestScore = -1000;
    int bestMove = -1;

    for (final move in _getAvailableMoves(board)) {
      final score = _minimax(
        board: board.play(move, aiPlayer),
        depth: 0,
        isMaximizing: false,
        aiPlayer: aiPlayer,
        maxDepth: maxDepth,
      );

      if (score > bestScore) {
        bestScore = score;
        bestMove = move;
      }
    }

    return bestMove;
  }

  int _minimax({
    required Board board,
    required int depth,
    required bool isMaximizing,
    required Player aiPlayer,
    required int maxDepth,
  }) {
    final winner = checkWinner(cells: board.cells, boardSize: board.size, winLength: 3);
    if (winner != null) {
      return winner.player == aiPlayer ? 10 - depth : depth - 10;
    }

    if (board.isFull || depth >= maxDepth) {
      return 0;
    }

    if (isMaximizing) {
      int bestScore = -1000;
      for (final move in _getAvailableMoves(board)) {
        final score = _minimax(
          board: board.play(move, aiPlayer),
          depth: depth + 1,
          isMaximizing: false,
          aiPlayer: aiPlayer,
          maxDepth: maxDepth,
        );
        bestScore = max(bestScore, score);
      }
      return bestScore;
    } else {
      int bestScore = 1000;
      for (final move in _getAvailableMoves(board)) {
        final score = _minimax(
          board: board.play(move, aiPlayer.opponent),
          depth: depth + 1,
          isMaximizing: true,
          aiPlayer: aiPlayer,
          maxDepth: maxDepth,
        );
        bestScore = min(bestScore, score);
      }
      return bestScore;
    }
  }
}
