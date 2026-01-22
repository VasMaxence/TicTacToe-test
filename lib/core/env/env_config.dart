import 'package:tictactoe_test/core/env/env_type.dart' show EnvironmentType;

class EnvironmentConfig {
  final bool enableLogs;

  const EnvironmentConfig({required this.enableLogs});
}

const Map<EnvironmentType, EnvironmentConfig> environmentConfigs = {
  EnvironmentType.dev: EnvironmentConfig(enableLogs: true),
  EnvironmentType.staging: EnvironmentConfig(enableLogs: true),
  EnvironmentType.prod: EnvironmentConfig(enableLogs: false),
};
