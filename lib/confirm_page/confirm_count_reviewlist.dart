import 'package:bacheloroppgave/models/tellinger.dart';
import 'package:flutter/material.dart';

class ConfirmReviewList extends StatelessWidget {
  final Tellinger data;
  late String list;

  final List<String> zones = <String>[
    'Sone 1',
    'Sone 2',
    'Sone 3',
    'Sone 4',
    'Sone 5'
  ];

  ConfirmReviewList(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: ListView.builder(
        itemCount: zones.length,
        itemBuilder: (context, index) {
          return Text(zones[index]);
        }
    ));
  }
}
