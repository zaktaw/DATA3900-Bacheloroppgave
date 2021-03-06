import 'ActivityObject.dart';
import 'ZoneObject.dart';

import 'package:hive/hive.dart';

part 'TttProjectInfo.g.dart';

/// Model for ttt project info. This info is retrieved from server and used througout the app.
@HiveType(typeId: 2)
class TttProjectInfo extends HiveObject {
  @HiveField(0)
  late List<ActivityObject> activities;

  @HiveField(1)
  late List<ZoneObject> zones;

  @HiveField(3)
  late String project_name;

  @HiveField(4)
  late String description;

  @HiveField(5)
  late int id;

  TttProjectInfo(
      {required this.activities,
      required this.zones,
      required this.project_name,
      required this.description,
      required this.id});

  factory TttProjectInfo.fromJson(Map<String, dynamic> json) {

    // map each object to their corresponding type 
    var list = json['activities'] as List;
    List<ActivityObject> listActivityObject =
        list.map((i) => ActivityObject.fromJson(i)).toList();

    list = json['zones'] as List;
    List<ZoneObject> listZoneObject =
        list.map((i) => ZoneObject.fromJson(i)).toList();    

    return TttProjectInfo(
      activities: listActivityObject,
      zones: listZoneObject,
      project_name: json['name'],
      description: json['description'],
      id: json['id']
    );
  }
}
