import 'package:tictactoe_test/features/game/domain/entities/difficulty.dart' show Difficulty;

import 'player.dart';

class Board {
  final List<Player?> cells;
  final int size;

  const Board(this.cells, {this.size = 3});

  factory Board.empty() => Board(List.filled(9, null));

  factory Board.fromDifficulty(Difficulty difficulty) {
    switch (difficulty) {
      case Difficulty.easy:
        return Board(List.filled(9, null), size: 3);
      case Difficulty.medium:
        return Board(List.filled(16, null), size: 4);
      case Difficulty.hard:
        return Board(List.filled(25, null), size: 5);
    }
  }

  Player? operator [](int index) => cells[index];

  Board play(int index, Player player) {
    if (cells[index] != null) {
      return this;
    }

    final updated = List<Player?>.from(cells);
    updated[index] = player;
    return Board(updated);
  }

  bool get isFull => cells.every((c) => c != null);
}
