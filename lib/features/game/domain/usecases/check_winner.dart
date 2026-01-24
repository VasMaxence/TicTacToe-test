import '../entities/player.dart';

class CheckWinner {
  Player? call({required List<Player?> cells, required int boardSize, int winLength = 3}) {
    for (int row = 0; row < boardSize; row++) {
      for (int col = 0; col <= boardSize - winLength; col++) {
        final winner = _checkLine(cells, boardSize, row, col, 0, 1, winLength);
        if (winner != null) return winner;
      }
    }

    for (int col = 0; col < boardSize; col++) {
      for (int row = 0; row <= boardSize - winLength; row++) {
        final winner = _checkLine(cells, boardSize, row, col, 1, 0, winLength);
        if (winner != null) return winner;
      }
    }

    for (int row = 0; row <= boardSize - winLength; row++) {
      for (int col = 0; col <= boardSize - winLength; col++) {
        final winner = _checkLine(cells, boardSize, row, col, 1, 1, winLength);
        if (winner != null) return winner;
      }
    }

    for (int row = 0; row <= boardSize - winLength; row++) {
      for (int col = winLength - 1; col < boardSize; col++) {
        final winner = _checkLine(cells, boardSize, row, col, 1, -1, winLength);
        if (winner != null) return winner;
      }
    }

    return null;
  }

  Player? _checkLine(List<Player?> cells, int size, int startRow, int startCol, int rowStep, int colStep, int length) {
    final first = cells[startRow * size + startCol];
    if (first == null) return null;

    for (int i = 1; i < length; i++) {
      final row = startRow + rowStep * i;
      final col = startCol + colStep * i;
      if (cells[row * size + col] != first) {
        return null;
      }
    }

    return first;
  }
}
