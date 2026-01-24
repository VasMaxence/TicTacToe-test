import 'package:flutter/material.dart';
import 'package:tictactoe_test/features/game/domain/entities/player.dart';
import 'package:tictactoe_test/features/game/presentation/widgets/player_text.dart';

class CellWidget extends StatelessWidget {
  final Player? value;
  final VoidCallback? onTap;

  const CellWidget({super.key, required this.value, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: value != null ? Center(child: PlayerText(player: value!, fontSize: 80, height: .8)) : const SizedBox(),
      ),
    );
  }
}
