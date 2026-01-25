import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe_test/features/score_history/data/repositories/score_repository_impl.dart';
import 'package:tictactoe_test/features/score_history/domain/repositories/score_repository.dart';
import 'score_datasource_provider.dart';

final scoreRepositoryProvider = Provider<ScoreRepository>((ref) {
  final datasource = ref.watch(scoreLocalDatasourceProvider);

  return ScoreRepositoryImpl(datasource);
});
