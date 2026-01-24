import 'package:tictactoe_test/features/game/domain/entities/player.dart';

class WinningLine {
  final List<int> indexes;
  final Player player;

  const WinningLine(this.indexes, this.player);

  bool contains(int index) => indexes.contains(index);

  @override
  bool operator ==(Object other) => identical(this, other) || other is WinningLine && runtimeType == other.runtimeType && _listEquals(indexes, other.indexes);

  @override
  int get hashCode => indexes.hashCode;

  static bool _listEquals(List<int> a, List<int> b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}
