import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe_test/features/game/domain/entities/game_state.dart';
import 'package:tictactoe_test/features/home/presentation/controller/home_providers.dart';
import 'package:tictactoe_test/features/score_history/domain/providers/score_usecases_providers.dart';
import 'game_controller.dart';
import 'package:tictactoe_test/features/game/domain/usecases/check_winner.dart';
import 'package:tictactoe_test/features/game/domain/usecases/get_ai_move.dart';
import 'package:tictactoe_test/features/game/domain/usecases/play_move.dart';

final checkWinnerProvider = Provider<CheckWinner>((ref) {
  return CheckWinner();
});

final playMoveProvider = Provider<PlayMove>((ref) {
  final checkWinner = ref.watch(checkWinnerProvider);
  return PlayMove(checkWinner);
});

final getAIMoveProvider = Provider<GetAIMove>((ref) {
  final checkWinner = ref.watch(checkWinnerProvider);
  return GetAIMove(checkWinner);
});

final gameControllerProvider = StateNotifierProvider<GameController, GameState>((ref) {
  final playMove = ref.watch(playMoveProvider);
  final getAIMove = ref.watch(getAIMoveProvider);
  final saveScoreUseCase = ref.watch(saveScoreProvider);
  final difficulty = ref.watch(difficultyProvider);
  final gameMode = ref.watch(gameModeProvider);
  final startingPlayer = ref.watch(startingPlayerProvider);

  return GameController(
    playMove: playMove,
    getAIMove: getAIMove,
    saveScoreUseCase: saveScoreUseCase,
    difficulty: difficulty,
    gameMode: gameMode,
    startingPlayer: startingPlayer,
  );
});
