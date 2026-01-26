// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:tictactoe_test/features/game/domain/entities/difficulty.dart'
    as _i7;
import 'package:tictactoe_test/features/game/presentation/screens/game_screen.dart'
    as _i1;
import 'package:tictactoe_test/features/home/presentation/screens/home_screen.dart'
    as _i2;
import 'package:tictactoe_test/features/score_history/presentation/screens/score_history_screen.dart'
    as _i3;
import 'package:tictactoe_test/features/settings/presentation/screens/settings_screen.dart'
    as _i4;

/// generated route for
/// [_i1.GameScreen]
class GameRoute extends _i5.PageRouteInfo<GameRouteArgs> {
  GameRoute({
    _i6.Key? key,
    required _i7.Difficulty difficulty,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         GameRoute.name,
         args: GameRouteArgs(key: key, difficulty: difficulty),
         initialChildren: children,
       );

  static const String name = 'GameRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GameRouteArgs>();
      return _i1.GameScreen(key: args.key, difficulty: args.difficulty);
    },
  );
}

class GameRouteArgs {
  const GameRouteArgs({this.key, required this.difficulty});

  final _i6.Key? key;

  final _i7.Difficulty difficulty;

  @override
  String toString() {
    return 'GameRouteArgs{key: $key, difficulty: $difficulty}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! GameRouteArgs) return false;
    return key == other.key && difficulty == other.difficulty;
  }

  @override
  int get hashCode => key.hashCode ^ difficulty.hashCode;
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.ScoreHistoryScreen]
class ScoreHistoryRoute extends _i5.PageRouteInfo<void> {
  const ScoreHistoryRoute({List<_i5.PageRouteInfo>? children})
    : super(ScoreHistoryRoute.name, initialChildren: children);

  static const String name = 'ScoreHistoryRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.ScoreHistoryScreen();
    },
  );
}

/// generated route for
/// [_i4.SettingsScreen]
class SettingsRoute extends _i5.PageRouteInfo<void> {
  const SettingsRoute({List<_i5.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.SettingsScreen();
    },
  );
}
