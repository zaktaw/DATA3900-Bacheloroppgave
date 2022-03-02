import 'package:flutter/material.dart';
import './zone_card.dart';

class MainMenu extends StatelessWidget {
  MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton(
        child: Text('Start telling'),
        onPressed: () =>  Navigator.of(context).pushNamed('/activity')
    ));
  }
}
