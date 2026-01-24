enum Player {
  x,
  o,
  i; // case bloquée

  bool get isPlayable => this != Player.i;

  Player get opponent => this == Player.x ? Player.o : Player.x;
}
