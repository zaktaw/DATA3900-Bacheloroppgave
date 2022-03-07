import 'package:bacheloroppgave/models/TttEntries.dart';
import 'package:flutter/material.dart';
import 'zone_card.dart';
import '../activity_page/activity_bottombar.dart';
import 'zones_topbar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ZonesList extends StatelessWidget {
  final TttEntries data;

  ZonesList(this.data, {Key? key}) : super(key: key);

  final List<String> zones = <String>['Sone 1', 'Sone 2', 'Sone 3', 'Sone 4'];

  @override
  Widget build(BuildContext context) {
    void navigateToConfirmPage() {
      if (data.getNumberOfZones() == zones.length) {
        Navigator.of(context).pushNamed(
          '/bekreft',
          arguments: data,
        );
      } else {
        Fluttertoast.showToast(
        msg: "This is a Toast message",  // message
        toastLength: Toast.LENGTH_SHORT, // length
        gravity: ToastGravity.CENTER,    // location
        timeInSecForIosWeb: 3            // duration
    );
      }
    }

    return Scaffold(
      appBar: ZonesTopbar(key: key),
      body: ListView.builder(
        itemCount: zones.length,
        itemBuilder: (context, index) {
          return ZoneCard(zones[index], index, data);
        },
      ),
      bottomNavigationBar: ActivityBottombar(
          navigateToConfirmPage, 'Fullfør telling', data, zones.length),
    );
  }
}
