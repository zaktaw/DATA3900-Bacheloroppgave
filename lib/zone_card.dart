// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';

class ZoneCard extends StatelessWidget {
  ZoneCard(this.zone_name, {Key? key}) : super(key: key);

  String zone_name;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
              flex: 5,
              child: InkWell(
                child: Text(zone_name,
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 114, 114, 182))),
                onTap: () => print('tap'),
                onLongPress: () => print('long tap'),
              ))
        ],
      ),
    );
  }
}
