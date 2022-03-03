import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'activity_bottombar.dart';
import 'activity_topbar.dart';
import 'activities_list.dart';
import './zones_list.dart';
import 'models/telling.dart';
import 'models/tellinger.dart';

final soner = [
  {'sone': 'Sone 1', 'rekkefølgenummer': 0},
  {'sone': 'Sone 2', 'rekkefølgenummer': 1},
  {'sone': 'Sone 3', 'rekkefølgenummer': 2},
  {'sone': 'Sone 4', 'rekkefølgenummer': 3}
];

final lastZone = soner.length;

class Activity extends StatefulWidget {
  Tellinger tellinger;
  int zoneIndex;

  Activity(this.tellinger, this.zoneIndex, {Key? key}) : super(key: key) {
    /* print("ZONE INDEX");
    print(zoneIndex);

    tellinger.showTellinger(); */
  }

  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  late Tellinger tellinger;
  late int zoneIndex;

  @override
  void initState() {
    zoneIndex = widget.zoneIndex;
    tellinger = widget.tellinger;
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
          arguments: tellinger,
        );
      }
    });
  }

  void nextZone() {
    incrementZoneIndex();
  }

  void goToZones() {
    Navigator.of(context).pushNamed(
      '/zones',
      arguments: tellinger,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ActivityTopbar(soner[zoneIndex]['sone'].toString(), goToZones),
        body: Container(
          child: ActivitiesList(tellinger.count, zoneIndex, tellinger),
        ),
        bottomNavigationBar: ActivityBottombar(nextZone),
      ),
    );
  }
}
