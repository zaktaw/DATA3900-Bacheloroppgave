import 'package:bacheloroppgave/models/tellinger.dart';
import 'package:flutter/material.dart';
import './zone_card.dart';
import 'activity_bottombar.dart';
import 'zones_topbar.dart';

class ZonesList extends StatelessWidget {
  final Tellinger data;

  ZonesList(this.data, {Key? key}) : super(key: key);

  final List<String> zones = <String>['Sone 1', 'Sone 2', 'Sone 3', 'Sone 4'];

  @override
  Widget build(BuildContext context) {
    void navigateToConfirmPage() {
      if (data.getNumberOfZone() == zones.length) {
        Navigator.of(context).pushNamed(
          '/bekreft',
          arguments: data,
        );
      } else {
        print("Not all zones are completed");
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
