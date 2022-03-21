// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:bacheloroppgave/local_storage_hive/TttEntriesBox.dart';
import 'package:bacheloroppgave/models/TttEntry.dart';
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
    return Card(
      child: Row(
        children: [
          Expanded(
              flex: 5,
              child: InkWell(
                child: Text(
                  zone_name,
                  style: TextStyle(
                      fontSize: 20,
                      color: checkIfCounted(zone_index)
                          ? Colors.green
                          : Color.fromARGB(255, 114, 114, 182)),
                ),
                onTap: () => navigateToActivityPage(context),
                onLongPress: () => Fluttertoast.showToast(
                    msg: zone_name + ': ' + zone_info, // message
                    toastLength: Toast.LENGTH_SHORT, // length
                    gravity: ToastGravity.CENTER, // location
                    timeInSecForIosWeb: 5 // duration,
                    ),
              ))
        ],
      ),
    );
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
