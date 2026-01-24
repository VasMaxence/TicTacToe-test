import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe_test/features/game/domain/entities/board.dart';
import 'package:tictactoe_test/features/game/domain/entities/difficulty.dart';

void main() {
  group('Test Board Entities', () {
    test('Instantiate a board - Easy', () {
      final board = Board.fromDifficulty(Difficulty.easy);

      expect(board.cells.length, 9);
    });

    test('Instantiate a board - Hard', () {
      final board = Board.fromDifficulty(Difficulty.hard);

      expect(board.cells.length, 25);
    });
  });
}
