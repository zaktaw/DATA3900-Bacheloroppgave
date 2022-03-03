import 'package:bacheloroppgave/models/tellinger.dart';
import 'package:flutter/material.dart';
import './zone_card.dart';

class MainMenu extends StatelessWidget {
  MainMenu({Key? key}) : super(key: key);

  Tellinger tellinger = Tellinger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton(
        child: Text('Start telling'),
        onPressed: () =>  Navigator.of(context).pushNamed('/activity', arguments: [tellinger, 0]) // start new count with new Tellinger object and zone index 0
    ));
  }
}
