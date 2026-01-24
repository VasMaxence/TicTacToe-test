import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe_test/features/game/domain/entities/difficulty.dart';

final difficultyProvider = StateProvider<Difficulty>((ref) {
  return Difficulty.easy;
});
