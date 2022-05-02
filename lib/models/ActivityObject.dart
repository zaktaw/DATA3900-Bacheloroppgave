import 'package:hive/hive.dart';

part 'ActivityObject.g.dart';

// Model for TTT activity object
@HiveType(typeId: 3)
class ActivityObject {

  @HiveField(0)
  late String activity_name;

  @HiveField(1)
  late String activity_info;

  ActivityObject(this.activity_name, this.activity_info);
}
