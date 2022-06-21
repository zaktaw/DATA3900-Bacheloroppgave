import 'dart:convert';

import 'package:bacheloroppgave/models/ActivityObject.dart';
import 'package:bacheloroppgave/models/ActivityZone.dart';
import 'package:bacheloroppgave/models/TttEntry.dart';
import 'package:bacheloroppgave/models/ZoneObject.dart';

/// Model for ttt object. This is the object that is sent to the server
class TttObject {
  late Map counts;
  late String name;
  late DateTime timestamp;
  late List<ActivityObject> activities;
  late int projectId;
  final List<ActivityZone> activityZones = [];
  late List<ZoneObject> zoneObjects = [];

  TttObject(
      this.counts, this.name, this.timestamp, this.activities, this.projectId, this.zoneObjects) {
    counts.forEach((key, value) {
      List countsList = value as List;
      List<TttEntry> tttEntries = [];

      /// go through all activities and check if each activity is stored in the list of ttt entries 
      /// if the activity is not included in the list, a new entry will be created for that activity with 0 counts
      /// this is done because all activities need to be included in the final ttt object
      activities.forEach((activity) {
        bool activityInCounts = false;

      /// Check if activity is in list, add to tttEntries if present in list
        countsList.forEach((object) {
          TttEntry count = object as TttEntry;
          if (count.activity == activity.activity_name) {
            activityInCounts = true;
            tttEntries.add(object);
          }
        });

        /// Add counts to tttEntries with default value '0' if activity is not in list
        /// e.g. activity has not been counted by user, but is appended to list to ensure that 
        /// complete object is sent to backend
        if (!activityInCounts) {
          TttEntry newCount = new TttEntry(activity.activity_name, 0);
          countsList.add(newCount);
          tttEntries.add(newCount);
        }
      });

      ActivityZone activityZone = ActivityZone(zoneObjects[key].id.toString(), tttEntries);
      activityZones.add(activityZone);
    });
  }

  Map<String, dynamic> toJson() {
    return {
      "project_id": projectId,
      "observer_name": name,
      "timestamp": timestamp
          .toString()
          .substring(0, 16), // remove seconds and milliseconds from timestamp
      "ActivityZones": activityZones
    };
  }
}
