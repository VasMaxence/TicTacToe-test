import 'package:hive_ce/hive_ce.dart';

part 'difficulty.g.dart';

@HiveType(typeId: 2)
enum Difficulty {
  @HiveField(0)
  easy,
  @HiveField(1)
  medium,
  @HiveField(2)
  hard,
}
