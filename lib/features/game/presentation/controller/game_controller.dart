import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe_test/features/game/domain/entities/difficulty.dart';
import 'package:tictactoe_test/features/game/domain/entities/game_state.dart';
import 'package:tictactoe_test/features/game/domain/usecases/play_move.dart';

class GameController extends StateNotifier<GameState> {
  final PlayMove _playMove;

  GameController({required PlayMove playMove, required Difficulty difficulty}) : _playMove = playMove, super(GameState.initial(difficulty));

  void play(int index) {
    state = _playMove(state, index);
  }

  void reset() {
    state = GameState.initial(state.difficulty);
  }
}
