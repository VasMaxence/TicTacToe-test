import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe_test/features/score_history/data/datasources/score_local_datasource.dart';
import 'score_box_provider.dart';

final scoreLocalDatasourceProvider = Provider<ScoreLocalDatasource>((ref) {
  final boxAsync = ref.watch(scoreBoxProvider);

  return boxAsync.when(data: (box) => ScoreLocalDatasourceImpl(box), loading: () => ScoreLocalDatasourceImpl(null), error: (e, _) => throw e);
});
