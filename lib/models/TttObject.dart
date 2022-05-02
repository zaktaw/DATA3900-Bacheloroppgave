import 'package:bacheloroppgave/models/TttEntry.dart';

// Model for ttt object. This is the object that is sent to the server
class TttObject {
  late Map counts;
  late String name;
  late DateTime timestamp;
  late List<String> activities;

  TttObject(this.counts, this.name, this.timestamp, this.activities) {
    counts.forEach((key, value) {
      List countsList = value as List;

      // go through all activities and check if each activity is stored in the list of ttt entries
      // if the activity is not included in the list, a new entry will be created for that activity with 0 counts
      // this is done because all activities need to be included in the final ttt object
      activities.forEach((activity) {
        bool activityInCounts = false;

        countsList.forEach((count) {
          TttEntry telling = count as TttEntry;
          if (telling.activity == activity) activityInCounts = true;
        });

        if (!activityInCounts) {
          TttEntry newCount = new TttEntry(activity, 0);
          countsList.add(newCount);
        }
      });
    });
  }
}
