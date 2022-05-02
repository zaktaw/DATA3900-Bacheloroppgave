import 'dart:ui';

import 'package:bacheloroppgave/local_storage_hive/TttEntriesBox.dart';
import 'package:bacheloroppgave/local_storage_hive/TttProjectInfoBox.dart';
import 'package:bacheloroppgave/models/ActivityObject.dart';
import 'package:bacheloroppgave/models/TttProjectInfo.dart';
import 'package:bacheloroppgave/models/ZoneObject.dart';
import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:flutter/material.dart';
import 'activity_bottombar.dart';
import 'activity_topbar.dart';
import 'activities_list.dart';
import '../models/TttEntries.dart';
import 'package:hive/hive.dart';

const String finish_zone = 'Neste sone';

class Activity extends StatefulWidget {
  TttEntries entries;
  int zoneIndex;

  Activity(this.entries, this.zoneIndex, {Key? key}) : super(key: key);

  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity>
    with SingleTickerProviderStateMixin {
  late TttEntries entries;
  late int zoneIndex;
  late List<ActivityObject> activityList;
  late List<ZoneObject> zoneList;

  late AnimationController controller;
  late Animation colorAnimation;
  late Animation sizeAnimation;

  final tttEntriesBox = TttEntriesBox.getTttEntries();

  // check if uses har performed a count on activity page
  bool performedCount() {
    return entries.checkTttEntryKey(zoneIndex);
  }

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

    // animation controller
    controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 100),
        reverseDuration: Duration(milliseconds: 300));
    colorAnimation =
        ColorTween(begin: ANIMATION_BEGIN_COLOR, end: ANIMATION_END_COLOR)
            .animate(controller);

    // reset state for widgets after animation is completed
    controller.addListener(() {
      setState(() {});
    });

    // this is needed for reversing the animation after it is completed
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      }
    });

    super.initState();
  }

  void incrementZoneIndex() {
    setState(() {
      print("Update zoneindex");
      if (zoneIndex < zoneList.length - 1) {
        controller.forward();
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
    entries.addZoneKey(zoneIndex);
    tttEntriesBox.put('tttEntriesMap', entries);
    incrementZoneIndex();
  }

  void goToZones() {
    entries.addZoneKey(zoneIndex);
    tttEntriesBox.put('tttEntriesMap', entries);
    Navigator.of(context).pushNamed(
      '/zones',
      arguments: entries,
    );
  }

  int getNumberOfCompletedZones() {
    if (TttEntriesBox.getTttEntries().isEmpty) return 0;
    TttEntries entries = TttEntriesBox.getTttEntries().getAt(0) as TttEntries;
    return entries.tttEntries.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ActivityTopbar(
            zoneList[zoneIndex].zone_name,
            zoneList[zoneIndex].zone_info,
            goToZones,
            activityList,
            colorAnimation,
            performedCount),
        body: Container(
            decoration: new BoxDecoration(color: BACKGROUND_COLOR),
            child: Column(
              children: [
                ActivitiesList(zoneIndex, entries, activityList),
                Stack(
                  children: [
                    LinearProgressIndicator(
                      value: getNumberOfCompletedZones() / zoneList.length,
                      minHeight: 20,
                      backgroundColor: PROGRESSBAR_BAR_BACKGROUND_COLOR,
                      color: PROGRESSBAR_BAR_COLOR,
                    ),
                    Center(
                      child: Text(
                        "Fullført " +
                            getNumberOfCompletedZones().toString() +
                            " / " +
                            zoneList.length.toString(),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                )
              ],
            )),
        bottomNavigationBar: ActivityBottombar(nextZone, finish_zone, entries,
            -1, TEXT_COLOR_BLACK, colorAnimation),
      ),
    );
  }
}
