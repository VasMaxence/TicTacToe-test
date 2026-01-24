import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe_test/features/game/domain/usecases/check_winner.dart';
import 'package:tictactoe_test/features/game/domain/entities/player.dart';

void main() {
  final checkWinner = CheckWinner();

  group('CheckWinner – win length = 3', () {
    test('3*3 - horizontal win', () {
      /** For Preview :
       * x x x
       * . . .
       * . . .
       */
      final cells = [Player.x, Player.x, Player.x, null, null, null, null, null, null];

      final winner = checkWinner(cells: cells, boardSize: 3, winLength: 3);

      expect(winner, Player.x);
    });

    test('4*4 - horizontal win - middle', () {
      /** For Preview :
       * . . . .
       * o o o .
       * . . . .
       * . . . .
       */
      final cells = [null, null, null, null, Player.o, Player.o, Player.o, null, null, null, null, null, null, null, null, null];

      final winner = checkWinner(cells: cells, boardSize: 4, winLength: 3);

      expect(winner, Player.o);
    });

    test('4*4 - vertical win', () {
      /** For Preview :
       * . x . .
       * . x . .
       * . x . .
       * . . . .
       */
      final cells = [null, Player.x, null, null, null, Player.x, null, null, null, Player.x, null, null, null, null, null, null];

      final winner = checkWinner(cells: cells, boardSize: 4, winLength: 3);

      expect(winner, Player.x);
    });

    test('5*5 - diagonal win', () {
      /** For Preview :
       * o . . . .
       * . o . . .
       * . . o . .
       * . . . . .
       * . . . . .
       */
      final cells = [
        Player.o,
        null,
        null,
        null,
        null,
        null,
        Player.o,
        null,
        null,
        null,
        null,
        null,
        Player.o,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
      ];

      final winner = checkWinner(cells: cells, boardSize: 5, winLength: 3);

      expect(winner, Player.o);
    });

    test('5x5 - diagonal win 2', () {
      /** For Preview :
       * . . x . .
       * . x . . .
       * x . . . .
       * . . . . .
       * . . . . .
       */
      final cells = [
        null,
        null,
        Player.x,
        null,
        null,
        null,
        Player.x,
        null,
        null,
        null,
        Player.x,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
      ];

      final winner = checkWinner(cells: cells, boardSize: 5, winLength: 3);

      expect(winner, Player.x);
    });

    test('no win when only two aligned', () {
      /** For Preview :
       * x x .
       * . . .
       * . . .
       */
      final cells = [Player.x, Player.x, null, null, null, null, null, null, null];

      final winner = checkWinner(cells: cells, boardSize: 3, winLength: 3);

      expect(winner, isNull);
    });

    test('no win when there is a gap', () {
      /** For Preview :
       * o . o
       * . . .
       * . . .
       */
      final cells = [Player.o, null, Player.o, null, null, null, null, null, null];

      final winner = checkWinner(cells: cells, boardSize: 3, winLength: 3);

      expect(winner, isNull);
    });

    test('no win in a full board', () {
      /** For Preview :
       * o x o
       * x o x
       * x o x
       */
      final cells = [Player.o, Player.x, Player.o, Player.x, Player.o, Player.x, Player.x, Player.o, Player.x];

      final winner = checkWinner(cells: cells, boardSize: 3, winLength: 3);

      expect(winner, isNull);
    });
  });
}
