// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TttProjectInfo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TttProjectInfoAdapter extends TypeAdapter<TttProjectInfo> {
  @override
  final int typeId = 2;

  @override
  TttProjectInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TttProjectInfo(
      activities: (fields[0] as List).cast<ActivityObject>(),
      zones: (fields[1] as List).cast<ZoneObject>(),
      observers: (fields[2] as List).cast<String>(),
      project_name: fields[3] as String,
      description: fields[4] as String,
      id: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TttProjectInfo obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.activities)
      ..writeByte(1)
      ..write(obj.zones)
      ..writeByte(2)
      ..write(obj.observers)
      ..writeByte(3)
      ..write(obj.project_name)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TttProjectInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
