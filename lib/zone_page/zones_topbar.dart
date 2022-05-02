import 'package:bacheloroppgave/models/ZoneObject.dart';
import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:flutter/material.dart';
import 'zones_info_pop.dart';

const String title = 'Soner';

//Topbar with infobutton for zone-page
class ZonesTopbar extends StatelessWidget with PreferredSizeWidget {
  final Size preferredSize;
  final List<ZoneObject> zoneList;

  ZonesTopbar(this.zoneList, {Key? key})
      : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

//Generates infotext based on all zones in the project 
  String generateInfoText() {
    String infoText = "";
    zoneList.forEach((element) {
      infoText += element.zone_name;
      infoText += ": ";
      infoText += element.zone_info;
      infoText += "\n";
    });

    return infoText;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: BUTTON_COLOR),
          onPressed: () => Navigator.of(context).pushNamed('/')),
      backgroundColor: TOPBAR_COLOR,
      centerTitle: true,
      title: const Text(title, style: TextStyle(color: TEXT_COLOR_BLACK)),
      actions: <Widget>[ZonesInfoPop(generateInfoText())],
    );
  }
}
