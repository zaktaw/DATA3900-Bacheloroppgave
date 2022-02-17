import 'package:flutter/material.dart';
import './zone_card.dart';

class ZonesList extends StatelessWidget {
  ZonesList({Key? key}) : super(key: key);

  final List<String> aktiviteter = <String>[
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
        itemCount: aktiviteter.length,
        itemBuilder: (context, index) {
          return ZoneCard(aktiviteter[index]);
        },
      ),
    );
  }
}
