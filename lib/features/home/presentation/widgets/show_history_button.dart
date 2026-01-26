import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tictactoe_test/core/router/app_router.gr.dart';
import 'package:tictactoe_test/shared/theme/colors.dart';
import 'package:tictactoe_test/shared/theme/test_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tictactoe_test/shared/widgets/responsive.dart';

class ShowHistoryButton extends StatelessWidget {
  const ShowHistoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(const ScoreHistoryRoute());
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/icons/ic_trophy.svg',
            colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
            width: formatWidth(18),
          ),
          sw(8),
          Text("home.view_scores".tr(), style: AppTextStyles.buttonStyle(18)),
        ],
      ),
    );
  }
}
