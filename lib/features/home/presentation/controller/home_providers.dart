import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe_test/features/game/domain/entities/difficulty.dart';
import 'package:tictactoe_test/features/game/domain/entities/game_mode.dart';
import 'package:tictactoe_test/features/game/domain/entities/player.dart';

final difficultyProvider = StateProvider<Difficulty>((ref) {
  return Difficulty.easy;
});

final gameModeProvider = StateProvider<GameMode>((ref) {
  return GameMode.pvp;
});

final startingPlayerProvider = StateProvider<Player>((ref) {
  return Player.x;
});
