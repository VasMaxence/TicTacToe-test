import 'package:tictactoe_test/features/game/domain/entities/difficulty.dart';
import 'package:tictactoe_test/features/game/domain/entities/player.dart';
import 'package:tictactoe_test/features/game/domain/entities/winning_line.dart';
import 'package:tictactoe_test/features/game/domain/entities/game_mode.dart';

class Score {
  final List<Player?> board;
  final int boardSize;
  final WinningLine? winningLine;
  final Difficulty difficulty;
  final GameMode gameMode;
  final DateTime playedAt;

  const Score({
    required this.board,
    required this.boardSize,
    required this.winningLine,
    required this.difficulty,
    required this.gameMode,
    required this.playedAt,
  });
}
