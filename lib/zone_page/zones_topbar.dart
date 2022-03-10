import 'package:bacheloroppgave/models/ZoneObject.dart';
import 'package:flutter/material.dart';
import 'zones_info_pop.dart';

class ZonesTopbar extends StatelessWidget with PreferredSizeWidget {
  final Size preferredSize;
  final List<ZoneObject> zoneList;

  ZonesTopbar(this.zoneList, {Key? key})
      : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

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
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pushNamed('/')),
      backgroundColor: Color.fromARGB(255, 189, 190, 187),
      centerTitle: true,
      title: const Text('Soner'),
      actions: <Widget>[ZonesInfoPop(generateInfoText())],
    );
  }
}