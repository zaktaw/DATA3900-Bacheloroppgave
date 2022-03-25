import 'dart:html';

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
          ": " +
          element.activity_info.toString() +
          "\n";
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
            Padding(padding: EdgeInsets.all(15), child: Text("Tittel")),
            Padding(padding: EdgeInsets.all(15), child: Text(showActivites())),
          ],
        ),
      );
  }
}
