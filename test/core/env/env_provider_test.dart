import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe_test/core/env/env_config.dart';
import 'package:tictactoe_test/core/providers/env_provider.dart';

void main() {
  test('envConfigProvider returns overridden EnvConfig', () {
    const testConfig = EnvironmentConfig(enableLogs: false);

    final container = ProviderContainer(overrides: [envConfigProvider.overrideWithValue(testConfig)]);
    final result = container.read(envConfigProvider);

    expect(result.enableLogs, false);
  });
}
