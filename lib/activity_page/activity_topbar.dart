import 'package:bacheloroppgave/models/ActivityObject.dart';
import 'package:flutter/material.dart';
import 'activities_info_pop.dart';
import 'zone_info_in_activities.dart';

const String _heroActivitiesPop = 'hero-activities-pop';

class ActivityTopbar extends StatelessWidget with PreferredSizeWidget {
  final Size preferredSize;
  final String zoneName;
  final String zoneInfo;
  late final VoidCallback goToZones;
  final List<ActivityObject> activityList;

  ActivityTopbar(
    this.zoneName,
    this.zoneInfo,
    this.goToZones,
    this.activityList, {
    Key? key,
  })  : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  String generateInfoText() {
    String infoText = "";

    activityList.forEach((element) {
      infoText += element.activity_name;
      infoText += ": ";
      infoText += element.activity_info;
      infoText += "\n";
    });

    return infoText;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => goToZones()),
      backgroundColor: Color.fromARGB(255, 189, 190, 187),
      centerTitle: true,
      title: ZoneInActivitiesPopButton(zoneInfo, zoneName, key: key),
      actions: <Widget>[
        ActivitiesPopButton(generateInfoText(), 'Informasjon om aktiviteter', key: key)
      ],
    );
  }
}
