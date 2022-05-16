// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ZoneObject.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ZoneObjectAdapter extends TypeAdapter<ZoneObject> {
  @override
  final int typeId = 4;

  @override
  ZoneObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ZoneObject(
      order_number: fields[0] as int,
      zone_name: fields[1] as String,
      zone_info: fields[2] as String,
      id: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ZoneObject obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.order_number)
      ..writeByte(1)
      ..write(obj.zone_name)
      ..writeByte(2)
      ..write(obj.zone_info)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ZoneObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
