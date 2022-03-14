// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ActivityObject.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActivityObjectAdapter extends TypeAdapter<ActivityObject> {
  @override
  final int typeId = 3;

  @override
  ActivityObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ActivityObject(
      fields[0] as String,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ActivityObject obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.activity_name)
      ..writeByte(1)
      ..write(obj.activity_info);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActivityObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
