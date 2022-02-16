import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'activity_bottombar.dart';
import 'activity_topbar.dart';
import 'activities_list.dart';
import './zones_list.dart';

final soner = [
  {'sone': 'Sone 1', 'rekkefølgenummer': 0},
  {'sone': 'Sone 2', 'rekkefølgenummer': 1},
  {'sone': 'Sone 3', 'rekkefølgenummer': 2},
  {'sone': 'Sone 4', 'rekkefølgenummer': 3}
];

final lastZone = soner.length;

final tellinger = [
  {'zoneIndex': 0, 'observasjoner': []}
];

class Activity extends StatefulWidget {
  Activity({Key? key}) : super(key: key);

  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  var zoneIndex = 0;

  void incrementZoneIndex() {
    setState(() {
      print("Update zoneindex");
      if (zoneIndex < lastZone-1) {
        zoneIndex++;
        print(zoneIndex);
      } else {
        //TODO route til soneoversikt
        print("Route til soneoversikt");
      }
    });
  }

  void incrementTelling(activity) {
    tellinger[zoneIndex];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ActivityTopbar(soner[zoneIndex]['sone'].toString()),
        body: Container(
          child: ActivitiesList(),
        ),
        bottomNavigationBar: ActivityBottombar(incrementZoneIndex),
      ),
    );
  }
}
