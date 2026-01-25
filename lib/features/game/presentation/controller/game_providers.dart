import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe_test/features/game/domain/entities/difficulty.dart';
import 'package:tictactoe_test/features/game/domain/entities/game_state.dart';
import 'package:tictactoe_test/features/score_history/domain/providers/score_usecases_providers.dart';
import 'game_controller.dart';
import 'package:tictactoe_test/features/game/domain/usecases/check_winner.dart';
import 'package:tictactoe_test/features/game/domain/usecases/play_move.dart';

final checkWinnerProvider = Provider<CheckWinner>((ref) {
  return CheckWinner();
});

final playMoveProvider = Provider<PlayMove>((ref) {
  final checkWinner = ref.watch(checkWinnerProvider);
  return PlayMove(checkWinner);
});

final gameControllerProvider = StateNotifierProvider<GameController, GameState>((ref) {
  final playMove = ref.watch(playMoveProvider);
  final saveScoreUseCase = ref.watch(saveScoreProvider);

  return GameController(playMove: playMove, saveScoreUseCase: saveScoreUseCase, difficulty: Difficulty.easy);
});
