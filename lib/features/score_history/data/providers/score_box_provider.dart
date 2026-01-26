import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:tictactoe_test/features/score_history/data/models/score_model.dart';

final scoreBoxProvider = FutureProvider<Box<ScoreModel>>((ref) async {
  final hive = Hive;
  return hive.openBox<ScoreModel>('scores-dev');
});
