import 'ActivityObject.dart';
import 'ZoneObject.dart';

import 'package:hive/hive.dart';

part 'TttProjectInfo.g.dart';

@HiveType(typeId: 2)
class TttProjectInfo extends HiveObject {
  @HiveField(0)
  late List<ActivityObject> activities;

  @HiveField(1)
  late List<ZoneObject> zones;

  @HiveField(2)
  late List<String> observers;

  @HiveField(3)
  late String project_name;

  TttProjectInfo(
      {required this.activities,
      required this.zones,
      required this.observers,
      required this.project_name
      });

  factory TttProjectInfo.fromJson(Map<String, dynamic> json) {
    return TttProjectInfo(
      activities: json['activities'],
      zones: json['zones'],
      observers: json['observers'],
      project_name: json['project_name'],
    );
  }
}
