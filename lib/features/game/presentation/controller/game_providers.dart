import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe_test/features/game/domain/entities/difficulty.dart';
import 'package:tictactoe_test/features/game/domain/entities/game_state.dart';
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

  return GameController(playMove: playMove, difficulty: Difficulty.easy);
});
