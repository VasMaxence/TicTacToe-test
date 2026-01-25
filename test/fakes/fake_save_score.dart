import 'package:tictactoe_test/features/score_history/domain/entities/score.dart';

class FakeSaveScore {
  final List<Score> savedScores = [];

  Future<void> call(Score score) async {
    savedScores.add(score);
  }
}
