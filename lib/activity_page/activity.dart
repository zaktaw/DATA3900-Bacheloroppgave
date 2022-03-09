import 'package:bacheloroppgave/local_storage_hive/TttEntriesBox.dart';
import 'package:flutter/material.dart';
import 'activity_bottombar.dart';
import 'activity_topbar.dart';
import 'activities_list.dart';
import '../models/TttEntries.dart';
import 'package:hive/hive.dart';

final soner = [
  {'sone': 'Sone 1', 'rekkefølgenummer': 0},
  {'sone': 'Sone 2', 'rekkefølgenummer': 1},
  {'sone': 'Sone 3', 'rekkefølgenummer': 2},
  {'sone': 'Sone 4', 'rekkefølgenummer': 3}
];

final lastZone = soner.length;

class Activity extends StatefulWidget {
  TttEntries entries;
  int zoneIndex;

  Activity(this.entries, this.zoneIndex, {Key? key}) : super(key: key) {}

  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  late TttEntries entries;
  late int zoneIndex;

  @override
  void dispose() {
    Hive.box('tttEntries').close();
    super.dispose();
  }

  @override
  void initState() {
    zoneIndex = widget.zoneIndex;
    entries = widget.entries;
    super.initState();
  }

  void incrementZoneIndex() {
    setState(() {
      print("Update zoneindex");
      if (zoneIndex < lastZone - 1) {
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
        appBar: ActivityTopbar(soner[zoneIndex]['sone'].toString(), goToZones),
        body: Container(
          child: ActivitiesList(entries.addTttEntry, zoneIndex, entries),
        ),
        bottomNavigationBar:
            ActivityBottombar(nextZone, 'Fullfør sone', entries, -1),
      ),
    );
  }
}
