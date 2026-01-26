import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tictactoe_test/features/score_history/presentation/controller/score_history_providers.dart';
import 'package:tictactoe_test/features/score_history/presentation/widgets/history_card.dart';
import 'package:tictactoe_test/shared/theme/colors.dart';
import 'package:tictactoe_test/shared/theme/test_styles.dart';
import 'package:tictactoe_test/shared/widgets/opacity_title.dart';
import 'package:tictactoe_test/shared/widgets/responsive.dart';
import 'package:tictactoe_test/shared/widgets/scrollable_scaffold.dart';

@RoutePage()
class ScoreHistoryScreen extends ConsumerWidget {
  const ScoreHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final scoresAsync = ref.watch(scoreHistoryProvider);

    return ScrollableScaffold(
      backgroundGradient: AppGradient.primary,
      builder: (context, scrollController, scrollY) {
        return Stack(
          children: [
            Positioned.fill(
              child: scoresAsync.when(
                data: (scores) {
                  if (scores.isEmpty) {
                    return Center(
                      child: Text("history.no_scores".tr(), style: AppTextStyles.defaultStyle(AppColors.white, 18)),
                    );
                  }

                  return ListView.separated(
                    controller: scrollController,
                    padding: pw(27).add(
                      EdgeInsets.only(
                        top: formatHeight(65) + mediaQuery.padding.top,
                        bottom: formatHeight(12) + mediaQuery.padding.bottom,
                      ),
                    ),
                    itemCount: scores.length,
                    separatorBuilder: (context, index) => sh(16),
                    itemBuilder: (context, index) {
                      final score = scores[index];
                      return ScoreHistoryCard(score: score);
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, stack) => Center(
                  child: Text("Erreur: $err", style: AppTextStyles.bodyStyle(16).copyWith(color: Colors.red)),
                ),
              ),
            ),

            OpacityTitle(scrollY: scrollY, title: "history.title".tr(), showByDefault: true),
          ],
        );
      },
    );
  }
}
