import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tictactoe_test/shared/theme/colors.dart';
import 'package:tictactoe_test/shared/theme/test_styles.dart';
import 'package:tictactoe_test/shared/widgets/responsive.dart';

class OpacityTitle extends StatelessWidget {
  final String title;
  final double scrollY;
  final VoidCallback? onTap;
  final bool showByDefault;
  final Color? scrollColor;

  const OpacityTitle({
    super.key,
    required this.scrollY,
    required this.title,
    this.onTap,
    this.scrollColor,
    this.showByDefault = false,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: formatHeight(4) + MediaQuery.of(context).padding.top, bottom: formatHeight(12)),
        decoration: BoxDecoration(
          color: scrollColor?.withValues(alpha: 1 * (scrollY / 100)),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withValues(alpha: 0.06 * (scrollY / 100)),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {
                    context.router.pop();
                  },
                  child: Padding(
                    padding: pwh(14, 8),
                    child: SvgPicture.asset(
                      'assets/icons/ic_back.svg',
                      colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                      width: formatWidth(24),
                    ),
                  ),
                ),
              ),
            ),
            sh(8),
            Expanded(
              flex: 3,
              child: Padding(
                padding: pw(27),
                child: Center(
                  child: Opacity(
                    opacity: showByDefault ? 1 : 1 * (scrollY / 100),
                    child: Text(title, style: AppTextStyles.titleStyle(18), textAlign: TextAlign.center),
                  ),
                ),
              ),
            ),
            sh(8),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
