import 'dart:math';

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
        return _withBlockedCells(size: 4, blockedCount: 4);

      case Difficulty.hard:
        return _withBlockedCells(size: 5, blockedCount: 7);
    }
  }

  Player? operator [](int index) => cells[index];

  Board play(int index, Player player) {
    if (cells[index] != null) {
      return this;
    }

    final updated = List<Player?>.from(cells);
    updated[index] = player;
    return Board(updated, size: size);
  }

  bool get isFull => cells.every((c) => c != null);

  static Board _withBlockedCells({required int size, required int blockedCount}) {
    final total = size * size;
    final cells = List<Player?>.filled(total, null);

    final random = Random();
    final blockedIndexes = <int>{};

    while (blockedIndexes.length < blockedCount) {
      blockedIndexes.add(random.nextInt(total));
    }

    for (final index in blockedIndexes) {
      cells[index] = Player.i;
    }

    return Board(cells, size: size);
  }
}
