import 'package:bacheloroppgave/activity_page/activity_bottombar.dart';
import 'package:bacheloroppgave/local_storage_hive/TttProjectInfoBox.dart';
import 'package:bacheloroppgave/models/ActivityObject.dart';
import 'package:bacheloroppgave/models/TttProjectInfo.dart';
import 'package:bacheloroppgave/models/ZoneObject.dart';
import 'package:bacheloroppgave/zone_page/zones_list.dart';
import 'package:bacheloroppgave/zone_page/zones_topbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../models/TttEntries.dart';
import 'package:hive/hive.dart';

class Zone extends StatefulWidget {
  late TttEntries entries;

  Zone(this.entries, {Key? key}) : super(key: key);

  @override
  _ZoneState createState() => _ZoneState();
}

class _ZoneState extends State<Zone> {
  late TttEntries entries;
  late List<ZoneObject> zoneList;

  @override
  void dispose() {
    Hive.box('tttProjectInfo').close();
    super.dispose();
  }

  @override
  void initState() {
    TttProjectInfo projectInfo =
        TttProjectInfoBox.getTttProjectInfo().getAt(0) as TttProjectInfo;

    zoneList = projectInfo.zones;

    entries = widget.entries;
    super.initState();
  }

  void navigateToConfirmPage() {
    if (entries.getNumberOfZones() == zoneList.length) {
      Navigator.of(context).pushNamed(
        '/bekreft',
        arguments: entries,
      );
    } else {
      Fluttertoast.showToast(
          msg: "This is a Toast message", // message
          toastLength: Toast.LENGTH_SHORT, // length
          gravity: ToastGravity.CENTER, // location
          timeInSecForIosWeb: 3 // duration
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ZonesTopbar(zoneList),
      body: Container(
        child: ZonesList(entries, zoneList),
      ),
      bottomNavigationBar: ActivityBottombar(
          navigateToConfirmPage, 'Fullfør telling', entries, zoneList.length),
    );
  }
}