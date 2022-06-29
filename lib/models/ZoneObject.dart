import 'package:hive/hive.dart';

part 'ZoneObject.g.dart';

/// Model for TTT zone object
@HiveType(typeId: 4)
class ZoneObject {
  @HiveField(0)
  late int order_number;

  @HiveField(1)
  late String zone_name;

  @HiveField(2)
  late String zone_info;

  @HiveField(3)
  late int id;

  ZoneObject(
      {required this.order_number,
      required this.zone_name,
      required this.zone_info,
      required this.id});

  factory ZoneObject.fromJson(Map<String, dynamic> json) {
    return ZoneObject(
        id: json['id'],
        order_number: json['sequencenumber'],
        zone_name: json['lettername'],
        zone_info: json['description']);
  }
}
