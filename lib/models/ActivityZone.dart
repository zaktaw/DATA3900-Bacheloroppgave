import 'TttEntry.dart';

/// Model for ActivityZone. This is the TTT entries that are part of the TttObject
class ActivityZone {
  late final String zoneId;
  late final List<TttEntry> activities;

  ActivityZone(this.zoneId, this.activities);

  Map<String, dynamic> toJson() {
    return {"zone_ID": zoneId, "Activities": activities};
  }

  String toString() {
    return "zone_ID: " + zoneId + ": " + activities.toString();
  }
}
