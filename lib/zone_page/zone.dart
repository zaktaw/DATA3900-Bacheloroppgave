import 'package:bacheloroppgave/activity_page/activity_bottombar.dart';
import 'package:bacheloroppgave/local_storage_hive/TttProjectInfoBox.dart';
import 'package:bacheloroppgave/models/TttProjectInfo.dart';
import 'package:bacheloroppgave/models/ZoneObject.dart';
import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:bacheloroppgave/resources/keys.dart';
import 'package:bacheloroppgave/zone_page/zones_list.dart';
import 'package:bacheloroppgave/zone_page/zones_topbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../models/TttEntries.dart';
import 'package:hive/hive.dart';

const String zone_toast = 'Du må fullføre alle soner før du sender inn telling!';
const String zone_confirm = 'Fullfør telling';

///Container for zonepage
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
        TttProjectInfoBox.getTttProjectInfo().get(projectInfoKey) as TttProjectInfo;
    zoneList = projectInfo.zones;
    entries = widget.entries;
    super.initState();
  }

  ///Method that enables the user to navigate to the confirm page if all zones are counted
  void navigateToConfirmPage() {
    if (entries.getNumberOfZones() == zoneList.length) {
      Navigator.of(context).pushNamed(
        '/bekreft',
        arguments: entries,
      );
    } else {
      Fluttertoast.showToast(
          msg: zone_toast, // message
          toastLength: Toast.LENGTH_SHORT, // length
          gravity: ToastGravity.CENTER, // location
          timeInSecForIosWeb: 3, // duration
          backgroundColor: TOAST_BACKGROUND_COLOR,
          textColor: TOAST_TEXT_COLOR,
          fontSize: TOAST_FONT_SIZE,
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
          navigateToConfirmPage, zone_confirm, entries, zoneList.length, TEXT_COLOR_DISABLED, null),
    );
  }
}
