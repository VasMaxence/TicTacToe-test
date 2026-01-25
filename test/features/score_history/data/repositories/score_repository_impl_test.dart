import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tictactoe_test/features/game/domain/entities/difficulty.dart';
import 'package:tictactoe_test/features/score_history/data/datasources/score_local_datasource.dart';
import 'package:tictactoe_test/features/score_history/data/models/score_model.dart';
import 'package:tictactoe_test/features/score_history/data/repositories/score_repository_impl.dart';
import 'package:tictactoe_test/features/score_history/domain/entities/score.dart';

class MockScoreLocalDatasource extends Mock implements ScoreLocalDatasource {}

void main() {
  late MockScoreLocalDatasource datasource;
  late ScoreRepositoryImpl repository;

  setUp(() {
    datasource = MockScoreLocalDatasource();
    repository = ScoreRepositoryImpl(datasource);
  });

  final score = Score(board: const [], boardSize: 3, winningLine: null, difficulty: Difficulty.easy, playedAt: DateTime.now());

  final model = ScoreModel.fromDomain(score);

  group('saveScore', () {
    test('should call save on datasource with mapped model', () async {
      when(() => datasource.save(any())).thenAnswer((_) async {});

      await repository.saveScore(score);

      verify(() => datasource.save(any())).called(1);
    });
  });

  group('getScores', () {
    test('should return list of scores from datasource', () async {
      when(() => datasource.getAll()).thenAnswer((_) async => [model]);

      final result = await repository.getScores();

      expect(result.length, 1);
      expect(result.first.difficulty, score.difficulty);
      verify(() => datasource.getAll()).called(1);
    });
  });

  setUpAll(() {
    registerFallbackValue(model);
  });
}
