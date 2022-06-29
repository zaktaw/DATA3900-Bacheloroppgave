import 'package:flutter/material.dart';
import '../models/ActivityObject.dart';
import 'activity_card.dart';
import '../models/TttEntry.dart';
import '../models/TttEntries.dart';


/// Class for list in activity. List contains ActivityCard-widgets  
class ActivitiesList extends StatelessWidget {
  final int zoneIndex;
  TttEntries entries;
  List<ActivityObject> activityList;

  ActivitiesList(this.zoneIndex, this.entries, this.activityList, {Key? key}) : super(key: key);

/// Sets stored value (no. counts) for for given activity in current zone, value set to '0' if the activity has no value in entries
/// Get entries for current index and checks if activity is in entries, set value in ActivityCard to stored value if found, set to '0' if not 
  String setValuesForPreviousCount(String activity) {
    var retrievedCounts = entries.getTttEntries(zoneIndex);
    for (var element in retrievedCounts) {
      TttEntry entry = element as TttEntry;
      if (entry.activity == activity) {
        return entry.count.toString();
      }
    }
    return '0';
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: activityList.length,
        itemBuilder: (context, index) {
          return ActivityCard(activityList[index].activity_name, activityList[index].activity_info, entries.addTttEntry, zoneIndex, setValuesForPreviousCount(activityList[index].activity_name));
        },
      ),
    );
  }
}
