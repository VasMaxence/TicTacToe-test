import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tictactoe_test/features/game/domain/entities/difficulty.dart';
import 'package:tictactoe_test/features/score_history/domain/entities/score.dart';
import 'package:tictactoe_test/features/score_history/domain/repositories/score_repository.dart';
import 'package:tictactoe_test/features/score_history/domain/usecases/save_score.dart';

class MockScoreRepository extends Mock implements ScoreRepository {}

void main() {
  late MockScoreRepository repository;
  late SaveScore usecase;

  setUp(() {
    repository = MockScoreRepository();
    usecase = SaveScore(repository);
  });

  final score = Score(board: const [], boardSize: 3, winningLine: null, difficulty: Difficulty.easy, playedAt: DateTime.now());

  test('should call saveScore on repository', () async {
    when(() => repository.saveScore(any())).thenAnswer((_) async {});

    await usecase(score);

    verify(() => repository.saveScore(score)).called(1);
    verifyNoMoreInteractions(repository);
  });

  setUpAll(() {
    registerFallbackValue(score);
  });
}
