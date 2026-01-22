import 'package:flutter_riverpod/flutter_riverpod.dart' show ProviderContainer;
import 'package:tictactoe_test/core/providers/env_provider.dart' show envConfigProvider;

late ProviderContainer _container;

void initLogger(ProviderContainer container) {
  _container = container;
}

/// Print Method
void printInDebug(dynamic obj) => (_container.read(envConfigProvider).enableLogs) ? print(obj) : null;

/// {@category Utils}
void printInfo(dynamic obj) => printInDebug("\x1B[32m[Info] $obj\x1B[0m");

/// {@category Utils}
void printWarning(dynamic obj) => printInDebug("\x1B[33m[Warning] $obj\x1B[0m");

/// {@category Utils}
void printError(dynamic obj) => printInDebug("\x1B[31m[Error] $obj\x1B[0m");

/// {@category Utils}
void printFailed(dynamic obj) => printInDebug("\x1B[31m[Error] $obj\x1B[0m");

/// {@category Utils}
void printDebug(dynamic obj) => printInDebug("\x1B[36m[Debug] $obj\x1B[0m");

/// {@category Utils}
void printExcept(dynamic obj) => printInDebug("\x1B[31m[Exception] $obj\x1B[0m");
