// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:bacheloroppgave/local_storage_hive/TttEntriesBox.dart';
import 'package:bacheloroppgave/models/TttEntry.dart';
import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:flutter/material.dart';
import '../models/TttEntries.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ZoneCard extends StatelessWidget {
  ZoneCard(this.zone_name, this.zone_info, this.zone_index, this.entries,
      {Key? key})
      : super(key: key);

  String zone_name;
  String zone_info;
  int zone_index;
  TttEntries entries;

  void navigateToActivityPage(BuildContext context) {
    Navigator.of(context)
        .pushNamed('/activity', arguments: [entries, zone_index]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: SHADOW_ZONELIST_BTN,
      margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
      child:Card(
        color: BACKGROUND_TEXT_COLOR,
        child: Row(
          children: [
            Expanded(
                flex: 5,
                child: InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(BOX_BORDER_RADIUS)
                    ),
                    margin: EdgeInsets.fromLTRB(15, 8, 15, 8),
                      child: Text(  
                        zone_name,
                        style: TextStyle(
                            fontSize: 23,
                            color: checkIfCounted(zone_index)
                                ? TEXT_COLOR_ZONE_FINISHED
                                : TEXT_COLOR_BLACK),
                      )),
                  onTap: () => navigateToActivityPage(context),
                  onLongPress: () => Fluttertoast.showToast(
                      msg: zone_name + ': ' + zone_info, // message
                      toastLength: Toast.LENGTH_SHORT, // length
                      gravity: ToastGravity.CENTER, // location
                      timeInSecForIosWeb: 5, // duration,
                      backgroundColor: TOAST_BACKGROUND_COLOR,
                      textColor: TOAST_TEXT_COLOR,
                      fontSize: TOAST_FONT_SIZE,
                      ),
                )
            )
        ],
      ),
    ));
  }

  bool checkIfCounted(int index) {

    if (TttEntriesBox.getTttEntries().isEmpty) return false;

    TttEntries entries = TttEntriesBox.getTttEntries().getAt(0) as TttEntries;

    if (entries.checkTttEntryKey(index)) {
      return true;
    }
    return false;
  }
}
