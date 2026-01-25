import 'package:tictactoe_test/features/score_history/domain/entities/score.dart';
import 'package:tictactoe_test/features/score_history/domain/repositories/score_repository.dart';

class GetScores {
  final ScoreRepository repository;

  GetScores(this.repository);

  Future<List<Score>> call() {
    return repository.getScores();
  }
}
