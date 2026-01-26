import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe_test/features/game/domain/entities/difficulty.dart';
import 'package:tictactoe_test/features/game/domain/entities/game_mode.dart';
import 'package:tictactoe_test/features/game/domain/entities/player.dart';
import 'package:tictactoe_test/features/game/domain/entities/winning_line.dart';
import 'package:tictactoe_test/features/score_history/data/models/score_model.dart';
import 'package:tictactoe_test/features/score_history/domain/entities/score.dart';

void main() {
  group('ScoreModel', () {
    final now = DateTime.now();
    final score = Score(
      board: [Player.x, Player.o, null, null, null, null, null, null, null],
      boardSize: 3,
      winningLine: const WinningLine([0, 1, 2], Player.x),
      difficulty: Difficulty.easy,
      gameMode: GameMode.pvp,
      playedAt: now,
    );

    test('fromDomain should correctly map Score to ScoreModel', () {
      final model = ScoreModel.fromDomain(score);

      expect(model.board, [0, 1, null, null, null, null, null, null, null]);
      expect(model.boardSize, 3);
      expect(model.winningPlayer, Player.x.index);
      expect(model.winningIndexes, [0, 1, 2]);
      expect(model.difficulty, Difficulty.easy);
      expect(model.gameMode, GameMode.pvp);
      expect(model.playedAt, now);
    });

    test('toDomain should correctly map ScoreModel to Score', () {
      final model = ScoreModel(
        board: [0, 1, null, null, null, null, null, null, null],
        boardSize: 3,
        winningPlayer: 0,
        winningIndexes: [0, 1, 2],
        difficulty: Difficulty.easy,
        gameMode: GameMode.pvp,
        playedAt: now,
      );

      final domain = model.toDomain();

      expect(domain.board, [Player.x, Player.o, null, null, null, null, null, null, null]);
      expect(domain.boardSize, 3);
      expect(domain.winningLine?.player, Player.x);
      expect(domain.winningLine?.indexes, [0, 1, 2]);
      expect(domain.difficulty, Difficulty.easy);
      expect(domain.gameMode, GameMode.pvp);
      expect(domain.playedAt, now);
    });

    test('toDomain should handle null winningLine', () {
      final model = ScoreModel(
        board: List.filled(9, null),
        boardSize: 3,
        winningPlayer: null,
        winningIndexes: null,
        difficulty: Difficulty.medium,
        gameMode: GameMode.ai,
        playedAt: now,
      );

      final domain = model.toDomain();

      expect(domain.winningLine, isNull);
      expect(domain.difficulty, Difficulty.medium);
      expect(domain.gameMode, GameMode.ai);
    });
  });
}
