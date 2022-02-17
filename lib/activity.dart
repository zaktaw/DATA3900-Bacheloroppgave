import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'activity_bottombar.dart';
import 'activity_topbar.dart';
import 'activities_list.dart';
import './zones_list.dart';
import 'models/tellinger.dart';

final soner = [
  {'sone': 'Sone 1', 'rekkefølgenummer': 0},
  {'sone': 'Sone 2', 'rekkefølgenummer': 1},
  {'sone': 'Sone 3', 'rekkefølgenummer': 2},
  {'sone': 'Sone 4', 'rekkefølgenummer': 3}
];

final lastZone = soner.length;

final tellinger = [
  {
    'zoneIndex': 0,
    'observasjoner': [
      {'aktivitet': 'GRUDIG', 'antall': 2},
      {'aktivitet': 'DIV', 'antall': 3},
      {'aktivitet': 'ALPERS', 'antall': 4},
    ]
  },
  {
    'zoneIndex': 1,
    'observasjoner': [
      {'GRUDIG': 2}
    ]
  }
];

var a = [
  {
    1: [
      {'aktivitet': 'GRUDIG', 'antall': 2}
    ]
  }
];

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
      }
    });
  }

  void incrementTelling(String activity) {
    print("Increment telling for activity " + activity);
    tellinger.showTellinger();
    tellinger.count(zoneIndex, activity, 2);
    tellinger.showTellinger();
    /* var zoneExists = false;

    tellinger.forEach((telling) {
      if (telling['zoneIndex'] == zoneIndex) {
        zoneExists = true;

        print('observations');
        var activityExists = false;
        List observations =
            telling['observasjoner'] as List<Map<String, Object>>;
        observations.forEach((element) {
          if (element['aktivitet'] == activity) {
            activityExists = true;
            element['antall']++;
          }
        });
      }
    });
//someMap["c"] = 3;
    // zone does not exist in map and needs to be added
    if (!zoneExists) {
      
    }

    print('map after changes:');
    print(tellinger); */
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ActivityTopbar(soner[zoneIndex]['sone'].toString()),
        body: Container(
          child: ActivitiesList(incrementTelling),
        ),
        bottomNavigationBar: ActivityBottombar(incrementZoneIndex),
      ),
    );
  }
}
