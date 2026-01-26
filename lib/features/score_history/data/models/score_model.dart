import 'package:hive_ce/hive_ce.dart';
import 'package:tictactoe_test/features/game/domain/entities/difficulty.dart';
import 'package:tictactoe_test/features/game/domain/entities/player.dart';
import 'package:tictactoe_test/features/game/domain/entities/winning_line.dart';
import 'package:tictactoe_test/features/game/domain/entities/game_mode.dart';
import '../../domain/entities/score.dart';

part 'score_model.g.dart';

@HiveType(typeId: 1)
class ScoreModel extends HiveObject {
  @HiveField(0)
  final List<int?> board;

  @HiveField(1)
  final int boardSize;

  @HiveField(2)
  final int? winningPlayer;

  @HiveField(3)
  final List<int>? winningIndexes;

  @HiveField(4)
  final Difficulty difficulty;

  @HiveField(5)
  final DateTime playedAt;

  @HiveField(6)
  final GameMode gameMode;

  ScoreModel({
    required this.board,
    required this.boardSize,
    required this.winningPlayer,
    required this.winningIndexes,
    required this.difficulty,
    this.gameMode = GameMode.pvp,
    required this.playedAt,
  });

  factory ScoreModel.fromDomain(Score score) {
    return ScoreModel(
      board: score.board.map((p) => p?.index).toList(),
      boardSize: score.boardSize,
      winningPlayer: score.winningLine?.player.index,
      winningIndexes: score.winningLine?.indexes,
      difficulty: score.difficulty,
      gameMode: score.gameMode,
      playedAt: score.playedAt,
    );
  }

  Score toDomain() {
    WinningLine? winningLine;
    if (winningPlayer != null && winningIndexes != null) {
      winningLine = WinningLine(winningIndexes!, Player.values[winningPlayer!]);
    }

    return Score(
      board: board.map((i) => i != null ? Player.values[i] : null).toList(),
      boardSize: boardSize,
      winningLine: winningLine,
      difficulty: difficulty,
      gameMode: gameMode,
      playedAt: playedAt,
    );
  }
}
