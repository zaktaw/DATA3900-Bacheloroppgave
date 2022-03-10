import 'package:hive/hive.dart';

part 'ZoneObject.g.dart';

@HiveType(typeId: 4)
class ZoneObject {

  @HiveField(0)
  late int order_number;

  @HiveField(1)
  late String zone_name;

  @HiveField(2)
  late String zone_info;

  ZoneObject(this.order_number, this.zone_name, this.zone_info);
}
