import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:tictactoe_test/features/game/domain/entities/difficulty.dart';
import 'package:tictactoe_test/features/game/domain/entities/game_mode.dart';
import 'package:tictactoe_test/features/score_history/data/datasources/score_local_datasource.dart';
import 'package:tictactoe_test/features/score_history/data/models/score_model.dart';
import 'package:tictactoe_test/hive_registrar.g.dart';

void main() {
  late Directory tempDir;
  late ScoreLocalDatasourceImpl datasource;
  late Box<ScoreModel> box;

  setUpAll(() async {
    tempDir = await Directory.systemTemp.createTemp('hive_test_');
    Hive.init(tempDir.path);
    Hive.registerAdapters();
  });

  setUp(() async {
    box = await Hive.openBox<ScoreModel>('scores_test');
    datasource = ScoreLocalDatasourceImpl(box);
  });

  tearDown(() async {
    await box.clear();
    await box.close();
  });

  tearDownAll(() async {
    await Hive.close();
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  ScoreModel createModel() => ScoreModel(
    board: [1, 1, 1, null, null, null, null, null, null],
    boardSize: 3,
    winningPlayer: 1,
    winningIndexes: [0, 1, 2],
    difficulty: Difficulty.easy,
    gameMode: GameMode.pvp,
    playedAt: DateTime.now(),
  );

  test('should persist and retrieve ScoreModel correctly', () async {
    final model = createModel();
    expect(await datasource.getAll(), isEmpty);

    await datasource.save(model);

    final results = await datasource.getAll();
    expect(results.length, 1);

    final savedModel = results.first;
    expect(savedModel.board, model.board);
    expect(savedModel.boardSize, model.boardSize);
    expect(savedModel.winningPlayer, model.winningPlayer);
    expect(savedModel.difficulty, model.difficulty);
    expect(savedModel.gameMode, model.gameMode);
    expect(savedModel.playedAt.millisecondsSinceEpoch, model.playedAt.millisecondsSinceEpoch);
  });

  test('should handle multiple scores', () async {
    await datasource.save(createModel());
    await datasource.save(createModel());

    final results = await datasource.getAll();
    expect(results.length, 2);
  });
}
