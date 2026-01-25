import 'package:tictactoe_test/features/score_history/domain/entities/score.dart';

abstract class ScoreRepository {
  Future<void> saveScore(Score score);
  Future<List<Score>> getScores();
}
