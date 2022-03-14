import 'package:bacheloroppgave/local_storage_hive/TttEntriesBox.dart';
import 'package:bacheloroppgave/local_storage_hive/TttProjectInfoBox.dart';
import 'package:bacheloroppgave/models/ActivityObject.dart';
import 'package:bacheloroppgave/models/TttProjectInfo.dart';
import 'package:bacheloroppgave/models/ZoneObject.dart';
import 'package:flutter/material.dart';
import 'activity_bottombar.dart';
import 'activity_topbar.dart';
import 'activities_list.dart';
import '../models/TttEntries.dart';
import 'package:hive/hive.dart';

const String finish_zone = 'Fullfør sone';

class Activity extends StatefulWidget {
  TttEntries entries;
  int zoneIndex;

  Activity(this.entries, this.zoneIndex, {Key? key}) : super(key: key);

  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  late TttEntries entries;
  late int zoneIndex;
  late List<ActivityObject> activityList;
  late List<ZoneObject> zoneList;

  @override
  void dispose() {
    Hive.box('tttEntries').close();
    Hive.box('tttProjectInfo').close();
    super.dispose();
  }

  @override
  void initState() {
    zoneIndex = widget.zoneIndex;
    entries = widget.entries;

    TttProjectInfo projectInfo =
        TttProjectInfoBox.getTttProjectInfo().getAt(0) as TttProjectInfo;
    activityList = projectInfo.activities;
    zoneList = projectInfo.zones;

    super.initState();
  }

  void incrementZoneIndex() {
    setState(() {
      print("Update zoneindex");
      if (zoneIndex < zoneList.length - 1) {
        zoneIndex++;
        print(zoneIndex);
      } else {
        print("Route til soneoversikt");
        Navigator.of(context).pushNamed(
          '/zones',
          arguments: entries,
        );
      }
    });
  }

  void nextZone() {
    final tttEntriesBox = TttEntriesBox.getTttEntries();
    tttEntriesBox.put('tttEntriesMap', entries);
    entries.addZoneKey(zoneIndex);
    incrementZoneIndex();
  }

  void goToZones() {
    Navigator.of(context).pushNamed(
      '/zones',
      arguments: entries,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ActivityTopbar(zoneList[zoneIndex].zone_name,
            zoneList[zoneIndex].zone_info, goToZones, activityList),
        body: Container(
          child: ActivitiesList(zoneIndex, entries, activityList),
        ),
        bottomNavigationBar:
            ActivityBottombar(nextZone, finish_zone, entries, -1),
      ),
    );
  }
}
