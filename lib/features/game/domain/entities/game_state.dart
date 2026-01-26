import 'package:tictactoe_test/features/game/domain/entities/winning_line.dart';

import 'board.dart';
import 'player.dart';
import 'difficulty.dart';
import 'game_mode.dart';

class GameState {
  final Board board;
  final Player currentPlayer;
  final bool isDraw;
  final Difficulty difficulty;
  final WinningLine? winningLine;
  final GameMode gameMode;

  const GameState({
    required this.board,
    required this.currentPlayer,
    required this.difficulty,
    required this.gameMode,
    this.isDraw = false,
    this.winningLine,
  });

  factory GameState.initial(Difficulty difficulty, GameMode gameMode, {Player currentPlayer = Player.x}) {
    return GameState(
      board: Board.fromDifficulty(difficulty),
      currentPlayer: currentPlayer,
      difficulty: difficulty,
      gameMode: gameMode,
    );
  }

  bool get isGameOver => winningLine != null || isDraw;

  GameState copyWith({
    Board? board,
    Player? currentPlayer,
    bool? isDraw,
    Difficulty? difficulty,
    WinningLine? winningLine,
    GameMode? gameMode,
    bool clearWinningLine = false,
  }) {
    return GameState(
      board: board ?? this.board,
      currentPlayer: currentPlayer ?? this.currentPlayer,
      isDraw: isDraw ?? this.isDraw,
      difficulty: difficulty ?? this.difficulty,
      gameMode: gameMode ?? this.gameMode,
      winningLine: clearWinningLine ? null : (winningLine ?? this.winningLine),
    );
  }
}
