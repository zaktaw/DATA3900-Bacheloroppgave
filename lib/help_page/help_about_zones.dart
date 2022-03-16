import 'package:bacheloroppgave/models/TttProjectInfo.dart';
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
    return Column(
      children: [
        const Align(
            alignment: Alignment.topCenter,
            child: Text("Informasjon om soner")),
        Align(alignment: Alignment.center, child: Text(showZones()))
      ],
    );
  }
}
