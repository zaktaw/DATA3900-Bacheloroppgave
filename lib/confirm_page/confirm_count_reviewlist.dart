import 'package:bacheloroppgave/models/TttEntries.dart';
import 'package:flutter/material.dart';

class ConfirmReviewList extends StatelessWidget {
  late TttEntries data;
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
          child: data.getNumberOfZones() != 0 ? 
          ListView.builder(
              itemCount: zones.length,
              itemBuilder: (context, index) {
                return Text(zones[index] +
                    ": " +
                    data.getNumberOfCountsInZone(index).toString());
              }) 
              : Text("Feil i listen, prøv igjen senere"));
    }
  }

