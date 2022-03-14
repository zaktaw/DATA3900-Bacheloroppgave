// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TttEntry.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TttEntryAdapter extends TypeAdapter<TttEntry> {
  @override
  final int typeId = 0;

  @override
  TttEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TttEntry(
      fields[0] as String,
      fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TttEntry obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.activity)
      ..writeByte(1)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TttEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
