import 'package:hive_ce/hive_ce.dart';

part 'game_mode.g.dart';

@HiveType(typeId: 3)
enum GameMode {
  @HiveField(0)
  pvp,
  @HiveField(1)
  ai,
}
