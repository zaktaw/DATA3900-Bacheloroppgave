import 'package:bacheloroppgave/models/tellinger.dart';
import 'package:flutter/material.dart';
import './zone_card.dart';

class ZonesList extends StatelessWidget {
  final Tellinger data;

  ZonesList(this.data, {Key? key}) : super(key: key);

  final List<String> zones = <String>[
    'Sone 1',
    'Sone 2',
    'Sone 3',
    'Sone 4',
    'Sone 5'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: zones.length,
        itemBuilder: (context, index) {
          return ZoneCard(zones[index], index, data);
        },
      ),
    );
  }
}
