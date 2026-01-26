import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tictactoe_test/core/env/env_config.dart';
import 'package:tictactoe_test/core/router/app_router.dart';

import 'flavors.dart';

class App extends StatelessWidget {
  final EnvironmentConfig config;

  final AppRouter _appRouter = AppRouter();

  App({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    final locale = context.locale;

    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(393, 852),
      builder: (context, child) => MaterialApp.router(
        key: ValueKey(locale.toString()),
        title: F.title,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: locale,
        theme: ThemeData(primarySwatch: Colors.blue),
        routerConfig: _appRouter.config(),
        builder: (context, child) => _flavorBanner(child: child ?? const SizedBox(), show: kDebugMode),
      ),
    );
  }

  Widget _flavorBanner({required Widget child, bool show = true}) => show
      ? Banner(
          location: BannerLocation.topStart,
          message: F.name,
          color: Colors.green.withAlpha(150),
          textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12.0, letterSpacing: 1.0),
          textDirection: ui.TextDirection.ltr,
          child: child,
        )
      : Container(child: child);
}
