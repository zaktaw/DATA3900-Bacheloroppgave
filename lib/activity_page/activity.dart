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

/// Main widget for activity. Contains all custom widgets for activities. Keeps track of current and counted zones
/// Controls animation when navigating to next zone
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

    /// Animation controller
    controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 100),
        reverseDuration: Duration(milliseconds: 300));
    colorAnimation =
        ColorTween(begin: ANIMATION_BEGIN_COLOR, end: ANIMATION_END_COLOR)
            .animate(controller);

    /// Reset state for widgets after animation is completed
    controller.addListener(() {
      setState(() {});
    });

    // This is needed for reversing the animation after it is completed
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      }
    });

    super.initState();
  }

  /// Go to next zone when bottombar is pressed.
  /// If pressed on last zone in project, navigate to zonelist
  void incrementZoneIndex() {
    setState(() {
      if (zoneIndex < zoneList.length - 1) {
        controller.forward();
        zoneIndex++;
      } else {
        Navigator.of(context).pushNamed(
          '/zones',
          arguments: entries,
        );
      }
    });
  }

/// Updates values in entries when navigating to next zone
  void nextZone() {
    entries.addZoneKey(zoneIndex);
    tttEntriesBox.put('tttEntriesMap', entries);
    incrementZoneIndex();
  }

/// Updates values in entries and navigate to zonelist when backbutton in appBar is pressed 
  void goToZones() {
    entries.addZoneKey(zoneIndex);
    tttEntriesBox.put('tttEntriesMap', entries);
    Navigator.of(context).pushNamed(
      '/zones',
      arguments: entries,
    );
  }

/// Used to show no. of counted zones in progressbar 
  int getNumberOfCompletedZones() {
    if (TttEntriesBox.getTttEntries().isEmpty) return 0;
    TttEntries entries = TttEntriesBox.getTttEntries().getAt(0) as TttEntries;
    return entries.tttEntries.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ActivityTopbar(
            zoneIndex,
            entries,
            zoneList[zoneIndex].zone_name,
            zoneList[zoneIndex].zone_info,
            goToZones,
            activityList,
            colorAnimation,
            performedCount),
        body: Container(
            decoration: const BoxDecoration(color: BACKGROUND_COLOR),
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
      );
  }
}
