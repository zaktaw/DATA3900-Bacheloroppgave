// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:bacheloroppgave/models/telling.dart';
import 'package:flutter/material.dart';
import 'models/tellinger.dart';

class ZoneCard extends StatelessWidget {
  ZoneCard(this.zone_name, this.zone_index, {Key? key}) : super(key: key);

  String zone_name;
  int zone_index;
  Tellinger tellinger = Tellinger();

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
                onTap: () => print('tap'),
                onLongPress: () => print('long tap'),
              ))
        ],
      ),
    );
  }

  bool checkIfCounted(int index) {
    tellinger.count(1, 'GRUDIG', 2);
    tellinger.count(3, 'GRUDIG', 1);
    if (tellinger.checkTellingKey(index)) {
      return true;
    }
    return false;
  }
}
