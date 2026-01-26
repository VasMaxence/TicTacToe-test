import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe_test/features/game/domain/entities/difficulty.dart';
import 'package:tictactoe_test/features/game/domain/entities/game_mode.dart';
import 'package:tictactoe_test/features/game/domain/entities/game_state.dart';
import 'package:tictactoe_test/features/game/domain/entities/player.dart';

void main() {
  group('Test GameState Entities', () {
    test('Instantiate a state - Easy', () {
      final state = GameState.initial(Difficulty.easy, GameMode.pvp);

      expect(state.board.cells.length, 9);
      expect(state.currentPlayer, Player.x);
      expect(state.difficulty, Difficulty.easy);
      expect(state.gameMode, GameMode.pvp);
    });

    test('Instantiate a state - Hard', () {
      final state = GameState.initial(Difficulty.hard, GameMode.pvp, currentPlayer: Player.o);

      expect(state.board.cells.length, 25);
      expect(state.currentPlayer, Player.o);
      expect(state.difficulty, Difficulty.hard);
      expect(state.gameMode, GameMode.pvp);
    });
  });
}
