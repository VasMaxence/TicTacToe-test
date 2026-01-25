import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe_test/features/game/domain/entities/difficulty.dart';
import 'package:tictactoe_test/features/game/domain/entities/game_state.dart';
import 'package:tictactoe_test/features/game/domain/usecases/play_move.dart';
import 'package:tictactoe_test/features/score_history/domain/entities/score.dart';
import 'package:tictactoe_test/features/score_history/domain/usecases/save_score.dart';

class GameController extends StateNotifier<GameState> {
  final PlayMove _playMove;
  final SaveScore? _saveScoreUseCase;

  GameController({required PlayMove playMove, required Difficulty difficulty, required SaveScore? saveScoreUseCase})
    : _playMove = playMove,
      _saveScoreUseCase = saveScoreUseCase,
      super(GameState.initial(difficulty));

  void play(int index) {
    final nextState = _playMove(state, index);
    if (_saveScoreUseCase != null && _shouldSaveScore(previous: state, next: nextState)) {
      _saveScore(nextState);
    }
    state = nextState;
  }

  bool _shouldSaveScore({required GameState previous, required GameState next}) {
    return !previous.isGameOver && next.isGameOver;
  }

  void reset() {
    state = GameState.initial(state.difficulty);
  }

  Future<void> _saveScore(GameState state) async {
    if (_saveScoreUseCase == null) {
      return;
    }

    final score = Score(
      board: state.board.cells,
      boardSize: state.board.size,
      winningLine: state.winningLine,
      difficulty: state.difficulty,
      playedAt: DateTime.now(),
    );

    await _saveScoreUseCase(score);
  }
}
