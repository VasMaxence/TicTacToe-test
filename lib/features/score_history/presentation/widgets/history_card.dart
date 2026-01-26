import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tictactoe_test/core/utils/utils.dart';
import 'package:tictactoe_test/features/game/domain/entities/player.dart';
import 'package:tictactoe_test/features/game/presentation/widgets/player_text.dart';
import 'package:tictactoe_test/features/score_history/domain/entities/score.dart';
import 'package:tictactoe_test/shared/theme/colors.dart';
import 'package:tictactoe_test/shared/theme/test_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tictactoe_test/shared/widgets/responsive.dart';

class ScoreHistoryCard extends StatelessWidget {
  final Score score;

  const ScoreHistoryCard({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    final dateStr = DateFormat('dd/MM/yyyy HH:mm').format(score.playedAt);
    final isWin = score.winningLine != null;
    final winnerPlayer = isWin ? score.winningLine!.player : null;

    final Color color = {
      Player.x: AppColors.playerX,
      Player.o: AppColors.playerO,
      Player.i: AppColors.playerBlocked,
    }[winnerPlayer ?? Player.i]!;

    return Container(
      padding: EdgeInsets.all(formatWidth(16)),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: .25),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 2),
      ),
      child: Row(
        children: [
          SizedBox(
            width: formatWidth(40),
            child: Center(child: PlayerText(player: winnerPlayer ?? Player.i, fontSize: 60, height: 0.7)),
          ),
          sw(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isWin ? "history.victory".tr(args: [enumToString(winnerPlayer!).toUpperCase()]) : "history.draw".tr(),
                  style: AppTextStyles.titleStyle(18).copyWith(color: color, height: 1.2),
                ),
                Text(
                  "history.difficulty".tr(args: [score.difficulty.name.toUpperCase()]),
                  style: AppTextStyles.bodyStyle(14),
                ),
              ],
            ),
          ),
          Text(dateStr, style: AppTextStyles.bodyStyle(12).copyWith(color: AppColors.white.withValues(alpha: 0.75))),
        ],
      ),
    );
  }
}
