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
    );
  }

  @override
  void write(BinaryWriter writer, TttProjectInfo obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.activities)
      ..writeByte(1)
      ..write(obj.zones)
      ..writeByte(2)
      ..write(obj.observers)
      ..writeByte(3)
      ..write(obj.project_name);
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
