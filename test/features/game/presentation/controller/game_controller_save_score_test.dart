import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tictactoe_test/features/game/domain/entities/difficulty.dart';
import 'package:tictactoe_test/features/game/domain/entities/game_mode.dart';
import 'package:tictactoe_test/features/game/domain/entities/game_state.dart';
import 'package:tictactoe_test/features/game/domain/entities/player.dart';
import 'package:tictactoe_test/features/game/domain/entities/winning_line.dart';
import 'package:tictactoe_test/features/game/domain/usecases/get_ai_move.dart';
import 'package:tictactoe_test/features/game/domain/usecases/play_move.dart';
import 'package:tictactoe_test/features/game/presentation/controller/game_controller.dart';
import 'package:tictactoe_test/features/score_history/domain/entities/score.dart';
import 'package:tictactoe_test/features/score_history/domain/usecases/save_score.dart';

class MockPlayMove extends Mock implements PlayMove {}

class MockGetAIMove extends Mock implements GetAIMove {}

class MockSaveScore extends Mock implements SaveScore {}

void main() {
  late MockPlayMove mockPlayMove;
  late MockGetAIMove mockGetAIMove;
  late MockSaveScore mockSaveScore;
  late GameController controller;

  setUp(() {
    mockPlayMove = MockPlayMove();
    mockGetAIMove = MockGetAIMove();
    mockSaveScore = MockSaveScore();
    controller = GameController(
      playMove: mockPlayMove,
      getAIMove: mockGetAIMove,
      difficulty: Difficulty.easy,
      gameMode: GameMode.pvp,
      startingPlayer: Player.x,
      saveScoreUseCase: mockSaveScore,
    );
  });

  setUpAll(() {
    registerFallbackValue(GameState.initial(Difficulty.easy, GameMode.pvp));
    registerFallbackValue(
      Score(
        board: const [],
        boardSize: 3,
        winningLine: null,
        difficulty: Difficulty.easy,
        gameMode: GameMode.pvp,
        playedAt: DateTime.now(),
      ),
    );
  });

  test('should call saveScore when game is over after a move (win)', () async {
    final initialState = GameState.initial(Difficulty.easy, GameMode.pvp);
    final winState = initialState.copyWith(winningLine: const WinningLine([0, 1, 2], Player.x));

    when(() => mockPlayMove(any(), any())).thenReturn(winState);
    when(() => mockSaveScore(any())).thenAnswer((_) async {});

    controller.play(0);

    verify(() => mockSaveScore(any())).called(1);
  });

  test('should call saveScore when game is over after a move (draw)', () async {
    final initialState = GameState.initial(Difficulty.easy, GameMode.pvp);
    final drawState = initialState.copyWith(isDraw: true);

    when(() => mockPlayMove(any(), any())).thenReturn(drawState);
    when(() => mockSaveScore(any())).thenAnswer((_) async {});

    controller.play(0);

    verify(() => mockSaveScore(any())).called(1);
  });

  test('should NOT call saveScore when game is NOT over after a move', () async {
    final initialState = GameState.initial(Difficulty.easy, GameMode.pvp);
    final nextState = initialState.copyWith(isDraw: false, clearWinningLine: true);

    when(() => mockPlayMove(any(), any())).thenReturn(nextState);

    controller.play(0);

    verifyNever(() => mockSaveScore(any()));
  });

  test('should NOT call saveScore if it was already over (no transition)', () async {
    final initialState = GameState.initial(Difficulty.easy, GameMode.pvp);
    final gameOverState = initialState.copyWith(isDraw: true);

    when(() => mockPlayMove(any(), any())).thenReturn(gameOverState);
    when(() => mockSaveScore(any())).thenAnswer((_) async {});

    controller.play(0);
    verify(() => mockSaveScore(any())).called(1);

    final anotherGameOverState = gameOverState.copyWith(isDraw: true);
    when(() => mockPlayMove(any(), any())).thenReturn(anotherGameOverState);

    controller.play(1);
    verifyNever(() => mockSaveScore(any()));
  });
}
