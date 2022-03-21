import 'package:bacheloroppgave/models/TttEntries.dart';
import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:bacheloroppgave/zone_page/zone_card.dart';
import 'package:flutter/material.dart';

const double buttonWidth = 175;

class HomeScreenButton extends StatefulWidget {
  HomeScreenButton({
    Key? key,
    required this.btnName,
    required this.route,
    required this.args,
    required this.onPressed,
  }) : super(key: key);

  final String btnName;
  final String route;
  final args;
  Function onPressed;

  @override
  _HomeScreenButtonState createState() => _HomeScreenButtonState();
}

class _HomeScreenButtonState extends State<HomeScreenButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: ElevatedButton(
            child: Text(
              widget.btnName,
              style: const TextStyle(color: TEXT_COLOR_BLACK),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(SECONDARY_COLOR),
                padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
                fixedSize: MaterialStateProperty.all(
                    const Size.fromWidth(buttonWidth))),
            onPressed: () {
              widget.onPressed();
              Navigator.of(context)
                  .pushNamed(widget.route, arguments: widget.args);
            }));
  }
}
