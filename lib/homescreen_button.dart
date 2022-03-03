import 'package:bacheloroppgave/models/tellinger.dart';
import 'package:bacheloroppgave/zone_card.dart';
import 'package:flutter/material.dart';

class HomeScreenButton extends StatefulWidget {
  const HomeScreenButton({Key? key, required this.btnName, required this.route})
      : super(key: key);

  final String btnName;
  final String route;

  @override
  _HomeScreenButtonState createState() => _HomeScreenButtonState();
}

class _HomeScreenButtonState extends State<HomeScreenButton> {
  
  Tellinger tellinger = Tellinger();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text(widget.btnName),
        onPressed: () => Navigator.of(context)
            .pushNamed(widget.route, arguments: [tellinger, 0]));
  }
}
