import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe_test/core/env/env_config.dart';
import 'package:tictactoe_test/core/providers/env_provider.dart';
import 'package:tictactoe_test/core/utils/logger.dart';

void main() {
  test('Logger prints when logs are enabled', () {
    const config = EnvironmentConfig(enableLogs: true);

    final container = ProviderContainer(overrides: [envConfigProvider.overrideWithValue(config)]);

    initLogger(container);

    expect(() => printInfo('test log'), prints('\x1B[32m[Info] test log\x1B[0m\n'));
    expect(() => printWarning('test log'), prints('\x1B[33m[Warning] test log\x1B[0m\n'));
    expect(() => printError('test log'), prints('\x1B[31m[Error] test log\x1B[0m\n'));
    expect(() => printFailed('test log'), prints('\x1B[31m[Error] test log\x1B[0m\n'));
    expect(() => printDebug('test log'), prints('\x1B[36m[Debug] test log\x1B[0m\n'));
    expect(() => printExcept('test log'), prints('\x1B[31m[Exception] test log\x1B[0m\n'));
  });
}
