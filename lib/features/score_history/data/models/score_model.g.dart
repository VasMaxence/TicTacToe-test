// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScoreModelAdapter extends TypeAdapter<ScoreModel> {
  @override
  final typeId = 1;

  @override
  ScoreModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScoreModel(
      board: (fields[0] as List).cast<int?>(),
      boardSize: (fields[1] as num).toInt(),
      winningPlayer: (fields[2] as num?)?.toInt(),
      winningIndexes: (fields[3] as List?)?.cast<int>(),
      difficulty: fields[4] as Difficulty,
      playedAt: fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ScoreModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.board)
      ..writeByte(1)
      ..write(obj.boardSize)
      ..writeByte(2)
      ..write(obj.winningPlayer)
      ..writeByte(3)
      ..write(obj.winningIndexes)
      ..writeByte(4)
      ..write(obj.difficulty)
      ..writeByte(5)
      ..write(obj.playedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScoreModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
