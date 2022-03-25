import 'package:bacheloroppgave/models/ActivityObject.dart';
import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:flutter/material.dart';
import 'activities_info_pop.dart';
import 'zone_info_in_activities.dart';

const String _heroActivitiesPop = 'hero-activities-pop';
const String info_act = 'Informasjon om aktiviteter';

class ActivityTopbar extends StatelessWidget with PreferredSizeWidget {
  final Size preferredSize;
  final String zoneName;
  final String zoneInfo;
  late final VoidCallback goToZones;
  final List<ActivityObject> activityList;
  final Animation<dynamic> colorAnimation;

  ActivityTopbar(
    this.zoneName,
    this.zoneInfo,
    this.goToZones,
    this.activityList, 
    this.colorAnimation,
    {
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
            color: BUTTON_COLOR,
          ),
          onPressed: () => goToZones()),
      backgroundColor: TOPBAR_COLOR,
      centerTitle: true,
      title: ZoneInActivitiesPopButton(zoneInfo, zoneName, colorAnimation, key: key),
      actions: <Widget>[
        ActivitiesPopButton(generateInfoText(), info_act, key: key)
      ],
    );
  }
}
