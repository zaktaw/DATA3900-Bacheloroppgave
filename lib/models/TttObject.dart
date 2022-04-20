import 'dart:convert';

import 'package:bacheloroppgave/models/ActivityObject.dart';
import 'package:bacheloroppgave/models/ActivityZone.dart';
import 'package:bacheloroppgave/models/TttEntry.dart';

class TttObject {
  late Map counts;
  late String name;
  late DateTime timestamp;
  late List<ActivityObject> activities;
  late int projectId;
  final List<ActivityZone> activityZones = [];

  TttObject(
      this.counts, this.name, this.timestamp, this.activities, this.projectId) {
    counts.forEach((key, value) {
      List countsList = value as List;
      List<TttEntry> tttEntries = [];

      activities.forEach((activity) {
        bool activityInCounts = false;

        countsList.forEach((count) {
          TttEntry telling = count as TttEntry;
          if (telling.activity == activity.activity_name) {
            activityInCounts = true;
            tttEntries.add(count);
          }
        });

        if (!activityInCounts) {
          TttEntry newCount = new TttEntry(activity.activity_name, 0);
          countsList.add(newCount);
          tttEntries.add(newCount);
        }
      });

      ActivityZone activityZone = ActivityZone(key.toString(), tttEntries);
      activityZones.add(activityZone);
    });
  }

  Map<String, dynamic> toJson() {
    return {
      "project_id": projectId,
      "observer_name": name,
      "timestamp": timestamp.toString(),
      "ActivityZones": activityZones
    };
  }

  void showTellinger() {
    counts.forEach((key, value) {
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
}
