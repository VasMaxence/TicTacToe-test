import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ProviderContainer, UncontrolledProviderScope;
import 'package:tictactoe_test/core/data/init_hive.dart';
import 'package:tictactoe_test/core/env/env_type.dart' show EnvironmentType;
import 'package:tictactoe_test/core/providers/env_provider.dart' show envConfigProvider;
import 'package:tictactoe_test/core/utils/logger.dart' show initLogger;

import 'app.dart';
import 'core/env/env_config.dart' show environmentConfigs;
import 'flavors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  F.appFlavor = Flavor.values.firstWhere((element) => element.name == appFlavor);

  final env = switch (F.appFlavor) {
    Flavor.dev => EnvironmentType.dev,
    Flavor.staging => EnvironmentType.staging,
    Flavor.prod => EnvironmentType.prod,
  };

  final config = environmentConfigs[env]!;

  final container = ProviderContainer(overrides: [envConfigProvider.overrideWithValue(config)]);

  initLogger(container);

  await initHiveDatabase();

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: App(config: config),
    ),
  );
}
