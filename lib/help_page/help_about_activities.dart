import 'dart:html';

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
          element.activity_info.toString() + "\n";
    });
    return activityListString;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Align(
          alignment: Alignment.topCenter,
          child: Text("Informasjon om aktiviteter")),
      Align(alignment: Alignment.center, child: Text(showActivites()))
    ]);
  }
}
