import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe_test/features/game/domain/entities/difficulty.dart';
import 'package:tictactoe_test/features/game/domain/entities/game_mode.dart';
import 'package:tictactoe_test/features/game/domain/entities/game_state.dart';
import 'package:tictactoe_test/features/game/domain/entities/player.dart';
import 'package:tictactoe_test/features/game/domain/usecases/get_ai_move.dart';
import 'package:tictactoe_test/features/game/domain/usecases/play_move.dart';
import 'package:tictactoe_test/features/score_history/domain/entities/score.dart';
import 'package:tictactoe_test/features/score_history/domain/usecases/save_score.dart';

class GameController extends StateNotifier<GameState> {
  final PlayMove _playMove;
  final GetAIMove _getAIMove;
  final SaveScore? _saveScoreUseCase;

  GameController({
    required PlayMove playMove,
    required GetAIMove getAIMove,
    required Difficulty difficulty,
    required GameMode gameMode,
    required Player startingPlayer,
    required SaveScore? saveScoreUseCase,
  }) : _playMove = playMove,
       _getAIMove = getAIMove,
       _saveScoreUseCase = saveScoreUseCase,
       super(GameState.initial(difficulty, gameMode, currentPlayer: startingPlayer)) {
    if (gameMode == GameMode.ai && startingPlayer == Player.o) {
      _playAIMove(state);
    }
  }

  void play(int index) {
    if (state.isGameOver) return;
    if (state.gameMode == GameMode.ai && state.currentPlayer == Player.o) return;

    final nextState = _playMove(state, index);
    _handleGameStateChange(nextState);

    if (nextState.gameMode == GameMode.ai && !nextState.isGameOver && nextState.currentPlayer == Player.o) {
      _playAIMove(nextState);
    }
  }

  void _handleGameStateChange(GameState nextState) {
    if (_saveScoreUseCase != null && _shouldSaveScore(previous: state, next: nextState)) {
      _saveScore(nextState);
    }
    state = nextState;
  }

  Future<void> _playAIMove(GameState currentState) async {
    await Future.delayed(const Duration(milliseconds: 600));
    final move = _getAIMove(board: currentState.board, difficulty: currentState.difficulty, aiPlayer: Player.o);
    if (move != -1) {
      final nextState = _playMove(currentState, move);
      _handleGameStateChange(nextState);
    }
  }

  bool _shouldSaveScore({required GameState previous, required GameState next}) {
    return !previous.isGameOver && next.isGameOver;
  }

  void reset() {
    state = GameState.initial(state.difficulty, state.gameMode);
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
      gameMode: state.gameMode,
      playedAt: DateTime.now(),
    );

    await _saveScoreUseCase(score);
  }
}
