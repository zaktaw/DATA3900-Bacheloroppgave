import 'package:hive/hive.dart';

part 'ActivityObject.g.dart';

/// Model for TTT activity object
@HiveType(typeId: 3)
class ActivityObject {
  @HiveField(0)
  late String activity_name;

  @HiveField(1)
  late String activity_info;

  ActivityObject({required this.activity_name, required this.activity_info});

  factory ActivityObject.fromJson(Map<String, dynamic> json) {
    return ActivityObject(
        activity_name: json['code'], activity_info: json['description']);
  }
}
