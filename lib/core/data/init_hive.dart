import 'dart:io';

import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tictactoe_test/features/score_history/data/models/score_model.dart';
import 'package:tictactoe_test/hive_registrar.g.dart';

Future<void> initHiveDatabase() async {
  final appDocumentDir = (await getApplicationCacheDirectory()).path;
  final hiveFile = File('$appDocumentDir/tic-tac-toe.hive');

  if (!hiveFile.existsSync()) {
    hiveFile.createSync(recursive: true);
  }

  Hive
    ..init(appDocumentDir)
    ..registerAdapters();
}

Future<Box<ScoreModel>> getScoreBox() async => await Hive.openBox<ScoreModel>('scores');
