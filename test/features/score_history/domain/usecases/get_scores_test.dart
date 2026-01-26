import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tictactoe_test/features/game/domain/entities/difficulty.dart';
import 'package:tictactoe_test/features/game/domain/entities/game_mode.dart';
import 'package:tictactoe_test/features/score_history/domain/entities/score.dart';
import 'package:tictactoe_test/features/score_history/domain/repositories/score_repository.dart';
import 'package:tictactoe_test/features/score_history/domain/usecases/get_scores.dart';

class MockScoreRepository extends Mock implements ScoreRepository {}

void main() {
  late MockScoreRepository repository;
  late GetScores usecase;

  setUp(() {
    repository = MockScoreRepository();
    usecase = GetScores(repository);
  });

  final scores = [
    Score(
      board: const [],
      boardSize: 3,
      winningLine: null,
      difficulty: Difficulty.easy,
      gameMode: GameMode.pvp,
      playedAt: DateTime.now(),
    ),
  ];

  test('should get scores from repository', () async {
    when(() => repository.getScores()).thenAnswer((_) async => scores);

    final result = await usecase();

    expect(result, scores);
    verify(() => repository.getScores()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
