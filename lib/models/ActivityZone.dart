import 'TttEntry.dart';

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
