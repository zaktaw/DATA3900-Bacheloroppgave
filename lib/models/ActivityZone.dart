import 'package:hive/hive.dart';

import 'TttEntry.dart';

part 'ActivityZone.g.dart';

// Model for ActivityZone. This is the TTT entries that are part of the TttObject
@HiveType(typeId: 7)
class ActivityZone {
  @HiveField(0)
  late final String zoneId;
  @HiveField(1)
  late final List<TttEntry> activities;

  ActivityZone(this.zoneId, this.activities);

  Map<String, dynamic> toJson() {
    return {"zone_ID": zoneId, "Activities": activities};
  }

  String toString() {
    return "zone_ID: " + zoneId + ": " + activities.toString();
  }
}
