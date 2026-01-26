import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe_test/shared/theme/colors.dart';
import 'package:tictactoe_test/shared/theme/test_styles.dart';
import 'package:tictactoe_test/shared/widgets/responsive.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("settings.title".tr(), style: AppTextStyles.titleStyle(24)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: AppColors.white),
          onPressed: () => context.router.back(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(formatWidth(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("settings.language".tr(), style: AppTextStyles.titleStyle(20)),
            sh(16),
            _LanguageTile(
              title: "settings.languages.fr".tr(),
              locale: const Locale('fr'),
              isSelected: context.locale.languageCode == 'fr',
            ),
            sh(12),
            _LanguageTile(
              title: "settings.languages.en".tr(),
              locale: const Locale('en'),
              isSelected: context.locale.languageCode == 'en',
            ),
          ],
        ),
      ),
    );
  }
}

class _LanguageTile extends StatelessWidget {
  final String title;
  final Locale locale;
  final bool isSelected;

  const _LanguageTile({required this.title, required this.locale, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!isSelected) {
          context.setLocale(locale);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: formatWidth(16), vertical: formatHeight(12)),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.white : AppColors.white.withValues(alpha: .2),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? AppColors.primary : AppColors.white.withOpacity(0.1), width: 1),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.bodyStyle(16).copyWith(
                  color: isSelected ? AppColors.primary : AppColors.white,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            if (isSelected) Icon(Icons.check_circle, color: AppColors.primary, size: formatWidth(24)),
          ],
        ),
      ),
    );
  }
}
