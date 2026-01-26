import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tictactoe_test/features/game/domain/entities/difficulty.dart';
import 'package:tictactoe_test/features/game/domain/entities/game_mode.dart';
import 'package:tictactoe_test/features/score_history/data/datasources/score_local_datasource.dart';
import 'package:tictactoe_test/features/score_history/data/models/score_model.dart';

class MockBox<T> extends Mock implements Box<T> {}

void main() {
  late MockBox<ScoreModel> box;
  late ScoreLocalDatasourceImpl datasource;

  setUp(() {
    box = MockBox<ScoreModel>();
    datasource = ScoreLocalDatasourceImpl(box);
  });

  final model = ScoreModel(
    board: const [],
    boardSize: 3,
    winningPlayer: null,
    winningIndexes: null,
    difficulty: Difficulty.easy,
    gameMode: GameMode.pvp,
    playedAt: DateTime.now(),
  );

  group('save', () {
    test('should add model to box', () async {
      when(() => box.add(any())).thenAnswer((_) async => 0);

      await datasource.save(model);

      verify(() => box.add(model)).called(1);
    });
  });

  group('getAll', () {
    test('should return all values from box', () async {
      when(() => box.values).thenReturn([model]);

      final result = await datasource.getAll();

      expect(result.length, 1);
      expect(result.first, model);
      verify(() => box.values).called(1);
    });
  });

  setUpAll(() {
    registerFallbackValue(model);
  });
}
