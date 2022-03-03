import 'package:bacheloroppgave/models/tellinger.dart';
import 'package:flutter/material.dart';

class ConfirmReviewList extends StatelessWidget {
  late Tellinger data;
  late String list;

  final List<String> zones = <String>[
    'Sone 1',
  ];

  ConfirmReviewList(this.data, {Key? key}) : super(key: key) {
    data = this.data;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: zones.length,
            itemBuilder: (context, index) {
              return Text(zones[index] + ": " + data.getNumberOfCountsInZone(index).toString());
            }));
  }
}
