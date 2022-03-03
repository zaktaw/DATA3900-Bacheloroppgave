import 'package:bacheloroppgave/models/telling.dart';

class Tellinger {
  late Map tellinger;

  Tellinger() {
    tellinger = {};
  }

  void addTelling(int zoneIndex, String activity) {
    Telling telling = Telling(activity, 1);
  }

  void showTellinger() {
    tellinger.forEach((key, value) {
      List test = value;
      print(key);
      test.forEach((element) {
        Telling test1 = element;
        print("Act:" + test1.activity + "   Count: " + test1.count.toString());
      });
    });
  }

  List getTellinger(int zone) {
    return tellinger[zone] ?? []; // return empty list if no tellinger is stored
  }

  int getNumberOfZone() {
    return tellinger.length;
  }

  int getNumberOfCountsInZone(int index) {
    int numberOfEntries = 0;
    List counts = tellinger[index];
    for (var element in counts) {
      Telling obj = element;
      numberOfEntries += obj.count;
    }
    return numberOfEntries;
  }

  bool checkTellingKey(int zone) {
    if (tellinger.containsKey(zone)) {
      return true;
    }
    return false;
  }

  void count(int zoneIndex, String activity, int count) {
    // Check if zone exsists. Set new value for count of actitivty if in the list. If not, create new entry for count/activity
    bool zoneFound = tellinger.containsKey(zoneIndex);
    if (zoneFound) {
      List counts = tellinger[zoneIndex];
      for (var element in counts) {
        var telling = element as Telling;
        if (telling.activity == activity) {
          telling.count = count;
          return;
        }
      }
      var newTelling = Telling(activity, count);
      counts.add(newTelling);

      //Added new zone with data from count to the list. Occurs the first time a count is reported in the zone.
    } else {
      List newZone = [];
      newZone.add(Telling(activity, count));
      tellinger[zoneIndex] = newZone;
    }
  }

  // adds current zone index as key in the map when going to the next zone page, even if no counts was registered
  void addZoneKey(int zoneIndex) {
    bool zoneFound = tellinger.containsKey(zoneIndex);
    if (!zoneFound) tellinger[zoneIndex] = [];
  }
}
