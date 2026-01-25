import 'package:tictactoe_test/features/score_history/data/datasources/score_local_datasource.dart';
import 'package:tictactoe_test/features/score_history/data/models/score_model.dart';
import 'package:tictactoe_test/features/score_history/domain/entities/score.dart';
import 'package:tictactoe_test/features/score_history/domain/repositories/score_repository.dart';

class ScoreRepositoryImpl implements ScoreRepository {
  final ScoreLocalDatasource datasource;

  ScoreRepositoryImpl(this.datasource);

  @override
  Future<void> saveScore(Score score) {
    return datasource.save(ScoreModel.fromDomain(score));
  }

  @override
  Future<List<Score>> getScores() async {
    final models = await datasource.getAll();
    return models.map((m) => m.toDomain()).toList();
  }
}
