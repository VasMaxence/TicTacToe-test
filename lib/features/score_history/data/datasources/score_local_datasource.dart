import 'package:hive_ce/hive_ce.dart';
import '../models/score_model.dart';

abstract class ScoreLocalDatasource {
  Future<void> save(ScoreModel model);
  Future<List<ScoreModel>> getAll();
}

class ScoreLocalDatasourceImpl implements ScoreLocalDatasource {
  final Box<ScoreModel>? box;

  ScoreLocalDatasourceImpl(this.box);

  @override
  Future<void> save(ScoreModel model) async {
    await box?.add(model);
  }

  @override
  Future<List<ScoreModel>> getAll() async {
    final items = box?.values.toList() ?? [];

    return items..sort((a, b) => b.playedAt.compareTo(a.playedAt));
  }
}
