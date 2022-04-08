import 'package:bacheloroppgave/resources/app_string.dart';
import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:flutter/material.dart';

import '../models/ActivityObject.dart';
import '../models/TttProjectInfo.dart';

class HelpActivites extends StatelessWidget {
  late TttProjectInfo projectInfo;

  HelpActivites(this.projectInfo, {Key? key}) : super(key: key);

  late List<ActivityObject> activityList = projectInfo.activities;

  String showActivites() {
    String activityListString = "";
    activityList.forEach((element) {
      activityListString += element.activity_name.toString() +
          ":  " +
          element.activity_info.toString() +
          "\n\n";
    });
    return activityListString;
  }

  @override
  Widget build(BuildContext context) {
      return Container(height: MediaQuery.of(context).size.height * HELP_BOX_MARGIN_FACTOR, width: MediaQuery.of(context).size.width * HELP_BOX_MARGIN_FACTOR,
      decoration: BoxDecoration(
          boxShadow: SHADOW_HELPSETTINGS_CONTAINER,
          color: BACKGROUND_TEXT_COLOR,
          borderRadius: BorderRadius.circular(BOX_BORDER_RADIUS)),
        child: ListView(
          children: [
            Text(HELP_ACTIVITES_TITLE, textAlign: TextAlign.center, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Padding(padding: EdgeInsets.all(15), child: Text(showActivites(), style: const TextStyle(fontSize: 16))),
          ],
        )
      );
  }
}
