// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:bacheloroppgave/activity_page/activity_confirm_back_pop.dart';
import 'package:bacheloroppgave/hero_dialog_route.dart';
import 'package:bacheloroppgave/home_screen/confirm_count_pop.dart';
import 'package:bacheloroppgave/models/ActivityObject.dart';
import 'package:bacheloroppgave/models/TttEntries.dart';
import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:flutter/material.dart';
import 'activities_info_pop.dart';
import 'zone_info_in_activities.dart';
import 'package:bacheloroppgave/activity_page/activities_info_pop.dart';

const String _heroActivitiesPop = 'hero-activities-pop';
const String info_act = 'Informasjon om aktiviteter';

class ActivityTopbar extends StatelessWidget with PreferredSizeWidget {
  final Size preferredSize;
  final String zoneName;
  final String zoneInfo;
  late final VoidCallback goToZones;
  final List<ActivityObject> activityList;
  final Animation<dynamic> colorAnimation;
  Function performedCount;
  TttEntries entries;
  int zoneIndex;

  ActivityTopbar(
    this.zoneIndex,
    this.entries,
    this.zoneName,
    this.zoneInfo,
    this.goToZones,
    this.activityList,
    this.colorAnimation,
    this.performedCount, {
    Key? key,
  })  : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  //Creates infotext based on current zone
  Table generateInfoText() {
    final rows = <TableRow>[];
    for(var element in activityList){
      rows.add(TableRow(children: <Widget> [
        Container(
          padding: EdgeInsets.all(3.0),
          child:Text(element.activity_name, textAlign: TextAlign.center,)),
        Container(
          padding: EdgeInsets.all(3.0),
          child: Text(element.activity_info))
      ]));
    }

    return Table(border: TableBorder.all(),
    columnWidths: const <int, TableColumnWidth>{
      0: FlexColumnWidth(0.2),
      1: FlexColumnWidth(0.8)
    },
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: rows);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: BUTTON_COLOR,
          ),
          onPressed: () => performedCount()
              ? goToZones()
              : Navigator.of(context).push(HeroDialogRoute(builder: (context) {
                  return PopActivityConfirmBackPop(entries, zoneIndex,
                      key: key);
                }))),
      backgroundColor: TOPBAR_COLOR,
      centerTitle: true,
      title: ZoneInActivitiesPopButton(zoneInfo, zoneName, colorAnimation,
          key: key),
      actions: <Widget>[
        ActivitiesPopButton(generateInfoText(), info_act, key: key)
      ],
    );
  }
}
