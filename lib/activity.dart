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
  Activity({Key? key}) : super(key: key);

  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  Tellinger tellinger = Tellinger();
  var zoneIndex = 0;

  void incrementZoneIndex() {
    setState(() {
      print("Update zoneindex");
      if (zoneIndex < lastZone - 1) {
        zoneIndex++;
        print(zoneIndex);
      } else {
        //TODO route til soneoversikt
        print("Route til soneoversikt");
        Navigator.of(context).pushNamed('/zones');
      }
    });
  }

  void decrementZoneIndex() {
    setState(() {
      if (zoneIndex > 0) {
        zoneIndex--;
        print(zoneIndex);
      }
    });
  }

  void nextZone() {
    incrementZoneIndex();
  }

  void previousZone() {
    decrementZoneIndex();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:
            ActivityTopbar(soner[zoneIndex]['sone'].toString(), previousZone),
        body: Container(
          child: ActivitiesList(tellinger.count, zoneIndex, tellinger),
        ),
        bottomNavigationBar: ActivityBottombar(nextZone),
      ),
    );
  }
}
