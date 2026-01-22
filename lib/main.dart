import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tictactoe_test/core/env/env_type.dart' show EnvironmentType;

import 'app.dart';
import 'core/env/env_config.dart' show environmentConfigs;
import 'flavors.dart';

void main() {
  F.appFlavor = Flavor.values.firstWhere((element) => element.name == appFlavor);

  final env = switch (F.appFlavor) {
    Flavor.dev => EnvironmentType.dev,
    Flavor.staging => EnvironmentType.staging,
    Flavor.prod => EnvironmentType.prod,
  };

  return runApp(App(config: environmentConfigs[env]!));
}
