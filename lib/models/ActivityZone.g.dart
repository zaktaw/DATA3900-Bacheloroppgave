// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ActivityZone.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActivityZoneAdapter extends TypeAdapter<ActivityZone> {
  @override
  final int typeId = 7;

  @override
  ActivityZone read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ActivityZone(
      fields[0] as String,
      (fields[1] as List).cast<TttEntry>(),
    );
  }

  @override
  void write(BinaryWriter writer, ActivityZone obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.zoneId)
      ..writeByte(1)
      ..write(obj.activities);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActivityZoneAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
