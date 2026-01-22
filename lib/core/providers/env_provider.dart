import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../env/env_config.dart';

final envConfigProvider = Provider<EnvironmentConfig>((ref) {
  throw UnimplementedError('EnvConfig must be overridden in main.dart');
});
