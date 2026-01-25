import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive.dart';

final hiveProvider = Provider<HiveInterface>((_) => Hive);
