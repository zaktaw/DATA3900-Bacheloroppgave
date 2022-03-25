import 'package:bacheloroppgave/models/TttProjectInfo.dart';
import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:flutter/material.dart';

import '../local_storage_hive/TttProjectInfoBox.dart';
import '../models/ZoneObject.dart';

class HelpZones extends StatelessWidget {
  late TttProjectInfo projectInfo;

  HelpZones(this.projectInfo, {Key? key}) : super(key: key);

  late List<ZoneObject> zoneList = projectInfo.zones;

  String showZones() {
    String zoneListString = "";
    zoneList.forEach((element) {
      zoneListString += element.zone_name.toString() +
          ": " +
          element.zone_info.toString() +
          "\n";
    });
    return zoneListString;
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
            Padding(padding: EdgeInsets.all(15), child: Text(showZones())),
          ],
        ),
      );
  }
}
