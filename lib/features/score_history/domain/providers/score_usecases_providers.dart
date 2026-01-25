import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe_test/features/score_history/data/providers/score_repository_provider.dart';
import 'package:tictactoe_test/features/score_history/domain/usecases/save_score.dart';
import 'package:tictactoe_test/features/score_history/domain/usecases/get_scores.dart';

final saveScoreProvider = Provider<SaveScore>((ref) {
  final repository = ref.watch(scoreRepositoryProvider);
  return SaveScore(repository);
});

final getScoresProvider = Provider<GetScores>((ref) {
  final repository = ref.watch(scoreRepositoryProvider);
  return GetScores(repository);
});
