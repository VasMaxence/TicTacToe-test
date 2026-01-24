import 'package:flutter/material.dart';
import 'package:tictactoe_test/shared/widgets/responsive.dart';

class BoardGridOverlay extends StatelessWidget {
  final int size;

  const BoardGridOverlay({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double cellSize = constraints.maxWidth / size;
        final double lineThickness = 3;
        const Color lineColor = Color(0xFFD0A2EB);

        return Stack(
          children: [
            for (int i = 1; i < size; i++)
              Positioned(
                left: cellSize * i - lineThickness / 2,
                top: 0,
                bottom: 0,
                child: Container(
                  width: lineThickness,
                  height: formatHeight(280),
                  decoration: BoxDecoration(color: lineColor, borderRadius: BorderRadius.circular(8)),
                ),
              ),

            for (int i = 1; i < size; i++)
              Positioned(
                top: cellSize * i - lineThickness / 2,
                left: 0,
                right: 0,
                child: Container(
                  height: lineThickness,
                  width: formatWidth(280),
                  decoration: BoxDecoration(color: lineColor, borderRadius: BorderRadius.circular(8)),
                ),
              ),
          ],
        );
      },
    );
  }
}
