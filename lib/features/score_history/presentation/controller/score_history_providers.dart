import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe_test/features/score_history/domain/entities/score.dart';
import '../../domain/providers/score_usecases_providers.dart';

final scoreHistoryProvider = FutureProvider.autoDispose<List<Score>>((ref) async {
  final getScores = ref.watch(getScoresProvider);
  return getScores();
});
