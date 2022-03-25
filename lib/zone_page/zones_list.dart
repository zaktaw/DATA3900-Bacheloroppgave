import 'package:bacheloroppgave/models/TttEntries.dart';
import 'package:bacheloroppgave/models/ZoneObject.dart';
import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:flutter/material.dart';
import 'zone_card.dart';
import '../activity_page/activity_bottombar.dart';
import 'zones_topbar.dart';
import 'package:fluttertoast/fluttertoast.dart';

const String zone_toast = "This is a toast!";

class ZonesList extends StatelessWidget {
  final TttEntries entries;
  final List<ZoneObject> zoneList;

  ZonesList(this.entries, this.zoneList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: ListView.builder(
          itemCount: zoneList.length,
          itemBuilder: (context, index) {
            return ZoneCard(zoneList[index].zone_name, zoneList[index].zone_info, index, entries);
          }),
    );
  }
}
