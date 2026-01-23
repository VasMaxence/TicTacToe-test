import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe_test/core/env/env_config.dart';

void main() {
  test('EnvConfig exposes correct values', () {
    const config = EnvironmentConfig(enableLogs: true);

    expect(config.enableLogs, true);
  });
}
