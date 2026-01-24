import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe_test/features/game/domain/entities/game_state.dart';
import 'package:tictactoe_test/features/game/presentation/controller/game_providers.dart';
import 'package:tictactoe_test/features/game/presentation/widgets/board_grid_overlay.dart';
import 'package:tictactoe_test/features/game/presentation/widgets/cell.dart';
import 'package:tictactoe_test/shared/widgets/responsive.dart';

class GameBoard extends StatelessWidget {
  final GameState state;

  const GameBoard({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final size = state.board.size;
    final double gridWidth = {3: formatWidth(300), 4: formatWidth(320), 5: formatWidth(340)}[size]!;

    return Padding(
      padding: pw(24),
      child: Stack(
        children: [
          Center(
            child: SizedBox(
              height: gridWidth,
              width: gridWidth,
              child: BoardGridOverlay(size: size),
            ),
          ),

          Center(
            child: SizedBox(
              height: gridWidth,
              width: gridWidth,
              child: AspectRatio(
                aspectRatio: 1,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: size),
                  itemCount: size * size,
                  itemBuilder: (context, index) {
                    final value = state.board.cells[index];

                    return CellWidget(
                      value: value,
                      onTap: state.isGameOver || value != null ? null : () => _onTap(context, index),
                      isWinningCell: state.winningLine?.indexes.contains(index) ?? false,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    final ref = ProviderScope.containerOf(context);
    ref.read(gameControllerProvider.notifier).play(index);
  }
}
