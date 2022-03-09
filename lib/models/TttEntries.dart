import 'package:bacheloroppgave/models/TttEntry.dart';
import '../zone_page/zones_list.dart';
import 'package:bacheloroppgave/local_storage_hive/TttEntriesBox.dart';

import 'package:hive/hive.dart';

part 'TttEntries.g.dart';

@HiveType(typeId: 1)
class TttEntries extends HiveObject {
  @HiveField(0)
  late Map tttEntries;

  TttEntries() {
    tttEntries = {};
  }

  void addTelling(int zoneIndex, String activity) {
    TttEntry tttEntry = TttEntry(activity, 1);
  }

  void showTellinger() {
    tttEntries.forEach((key, value) {
      if (value is List) {
        List test = value;
        print(key);
        test.forEach((element) {
          TttEntry test1 = element;
          print(
              "Act:" + test1.activity + "   Count: " + test1.count.toString());
        });
      }
    });
  }

  List getTttEntries(int zone) {
    return tttEntries[zone] ??
        []; // return empty list if no tellinger is stored
  }

  int getNumberOfZones() {
    return tttEntries.length;
  }

  int getNumberOfCountsInZone(int index) {
    int numberOfEntries = 0;
    List counts = tttEntries[index];
    for (var element in counts) {
      TttEntry obj = element;
      numberOfEntries += obj.count;
    }
    return numberOfEntries;
  }

  bool checkTttEntryKey(int zone) {
    if (tttEntries.containsKey(zone)) {
      return true;
    }
    return false;
  }

  void addTttEntry(int zoneIndex, String activity, int count) {
    // Check if zone exsists. Set new value for count of actitivty if in the list. If not, create new entry for count/activity
    bool zoneFound = tttEntries.containsKey(zoneIndex);
    if (zoneFound) {
      List entries = tttEntries[zoneIndex];
      for (var element in entries) {
        var entry = element as TttEntry;
        if (entry.activity == activity) {
          entry.count = count;
          return;
        }
      }
      var newEntry = TttEntry(activity, count);
      entries.add(newEntry);

      //Added new zone with data from count to the list. Occurs the first time a count is reported in the zone.
    } else {
      List newZone = [];
      newZone.add(TttEntry(activity, count));
      tttEntries[zoneIndex] = newZone;
    }
  }

  // adds current zone index as key in the map when going to the next zone page, even if no counts was registered
  void addZoneKey(int zoneIndex) {
    bool zoneFound = tttEntries.containsKey(zoneIndex);
    if (!zoneFound) tttEntries[zoneIndex] = [];
  }
}
