// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TttEntries.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TttEntriesAdapter extends TypeAdapter<TttEntries> {
  @override
  final int typeId = 1;

  @override
  TttEntries read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TttEntries()
      ..tttEntries = (fields[0] as Map).cast<dynamic, dynamic>()
      ..timestamp = fields[1] as DateTime;
  }

  @override
  void write(BinaryWriter writer, TttEntries obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.tttEntries)
      ..writeByte(1)
      ..write(obj.timestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TttEntriesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
