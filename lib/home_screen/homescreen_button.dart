import 'package:bacheloroppgave/models/TttEntries.dart';
import 'package:bacheloroppgave/zone_page/zone_card.dart';
import 'package:flutter/material.dart';

class HomeScreenButton extends StatefulWidget {
  HomeScreenButton(
      {Key? key,
      required this.btnName,
      required this.route,
      required this.args,
      })
      : super(key: key);

  final String btnName;
  final String route;
  final args;

  @override
  _HomeScreenButtonState createState() => _HomeScreenButtonState();
}

class _HomeScreenButtonState extends State<HomeScreenButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text(widget.btnName),
        onPressed: () {
          Navigator.of(context).pushNamed(widget.route, arguments: widget.args);
        });
  }
}
