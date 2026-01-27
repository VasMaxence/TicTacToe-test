import 'package:flutter/material.dart';
import 'package:tictactoe_test/features/game/domain/entities/player.dart';
import 'package:tictactoe_test/features/game/presentation/widgets/player_text.dart';
import 'package:tictactoe_test/shared/widgets/responsive.dart';

class CellWidget extends StatefulWidget {
  final Player? value;
  final VoidCallback? onTap;
  final bool isWinningCell;

  const CellWidget({super.key, required this.value, required this.onTap, required this.isWinningCell});

  @override
  State<CellWidget> createState() => _CellWidgetState();
}

class _CellWidgetState extends State<CellWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 180));

    _scale = CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);

    _opacity = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    if (widget.value != null) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(CellWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Déclenche l’animation UNIQUEMENT à l’apparition
    if (oldWidget.value == null && widget.value != null) {
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color color =
        {Player.x: Color(0xFFFF0004), Player.o: Color(0xFF1298F8), Player.i: Color(0xFFF8B312)}[widget.value] ??
        Colors.transparent;

    final decoration = widget.isWinningCell
        ? BoxDecoration(
            color: color.withValues(alpha: .25),
            border: Border.all(color: widget.isWinningCell ? color : Colors.transparent, width: 2),
            borderRadius: BorderRadius.circular(r(4)),
          )
        : null;

    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: EdgeInsets.all(formatWidth(4)),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          decoration: decoration,
          child: widget.value == null
              ? const SizedBox()
              : Center(
                  child: FadeTransition(
                    opacity: _opacity,
                    child: ScaleTransition(
                      scale: _scale,
                      child: PlayerText(player: widget.value!, fontSize: 80, height: .8),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
