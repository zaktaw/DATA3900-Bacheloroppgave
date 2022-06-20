// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TttObject.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TttObjectAdapter extends TypeAdapter<TttObject> {
  @override
  final int typeId = 6;

  @override
  TttObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TttObject(
      (fields[0] as Map).cast<dynamic, dynamic>(),
      fields[1] as String,
      fields[2] as DateTime,
      (fields[3] as List).cast<ActivityObject>(),
      fields[4] as int,
      (fields[6] as List).cast<ZoneObject>(),
    );
  }

  @override
  void write(BinaryWriter writer, TttObject obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.counts)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.timestamp)
      ..writeByte(3)
      ..write(obj.activities)
      ..writeByte(4)
      ..write(obj.projectId)
      ..writeByte(5)
      ..write(obj.activityZones)
      ..writeByte(6)
      ..write(obj.zoneObjects);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TttObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
