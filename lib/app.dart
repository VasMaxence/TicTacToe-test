import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe_test/core/env/env_config.dart';
import 'package:tictactoe_test/core/router/app_router.dart';

import 'flavors.dart';

class App extends StatelessWidget {
  final EnvironmentConfig config;

  final AppRouter _appRouter = AppRouter();

  App({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: F.title,
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: _appRouter.config(),
      builder: (context, child) => _flavorBanner(child: child ?? const SizedBox(), show: kDebugMode),
    );
  }

  Widget _flavorBanner({required Widget child, bool show = true}) => show
      ? Banner(
          location: BannerLocation.topStart,
          message: F.name,
          color: Colors.green.withAlpha(150),
          textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 12.0, letterSpacing: 1.0),
          textDirection: TextDirection.ltr,
          child: child,
        )
      : Container(child: child);
}
