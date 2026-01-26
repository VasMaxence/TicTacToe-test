// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_mode.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameModeAdapter extends TypeAdapter<GameMode> {
  @override
  final typeId = 3;

  @override
  GameMode read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return GameMode.pvp;
      case 1:
        return GameMode.ai;
      default:
        return GameMode.pvp;
    }
  }

  @override
  void write(BinaryWriter writer, GameMode obj) {
    switch (obj) {
      case GameMode.pvp:
        writer.writeByte(0);
      case GameMode.ai:
        writer.writeByte(1);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameModeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
