import 'package:flutter/material.dart';
import '../models/ActivityObject.dart';
import 'activity_card.dart';
import '../models/TttEntry.dart';
import '../models/TttEntries.dart';

class ActivitiesList extends StatelessWidget {
  final int zoneIndex;
  TttEntries entries;
  List<ActivityObject> activityList;

  ActivitiesList(this.zoneIndex, this.entries, this.activityList, {Key? key}) : super(key: key);



  String setValuesForPreviousCount(String activity) {
    var retrievedTellinger = entries.getTttEntries(zoneIndex);

    for (var element in retrievedTellinger) {
      TttEntry entry = element as TttEntry;
      if (entry.activity == activity) {
        return entry.count.toString();
      }
    }

    return '0';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: activityList.length,
        itemBuilder: (context, index) {
          return ActivityCard(activityList[index].activity_name, activityList[index].activity_info, entries.addTttEntry, zoneIndex, setValuesForPreviousCount(activityList[index].activity_name));
        },
      ),
    );
  }
}
