import 'package:tictactoe_test/features/score_history/domain/entities/score.dart';
import 'package:tictactoe_test/features/score_history/domain/repositories/score_repository.dart';

class SaveScore {
  final ScoreRepository repository;

  SaveScore(this.repository);

  Future<void> call(Score score) {
    return repository.saveScore(score);
  }
}
