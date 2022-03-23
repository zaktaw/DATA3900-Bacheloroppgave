import 'package:bacheloroppgave/models/TttEntries.dart';
import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:bacheloroppgave/zone_page/zone_card.dart';
import 'package:flutter/material.dart';

const double buttonWidth = 250;

class HomeScreenButton extends StatefulWidget {
  HomeScreenButton({
    Key? key,
    required this.btnName,
    required this.route,
    required this.margin,
    required this.args,
    required this.onPressed,
  }) : super(key: key);

  final String btnName;
  final String route;
  final double margin;
  final args;
  Function onPressed;

  @override
  _HomeScreenButtonState createState() => _HomeScreenButtonState();
}

class _HomeScreenButtonState extends State<HomeScreenButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: widget.margin),
        child: ElevatedButton(
            child: Text(
              widget.btnName,
              style: const TextStyle(color: TEXT_COLOR_BLACK, fontSize: HOMESCREEN_BTN_FONTSIZE, fontWeight: FontWeight.bold),
            ),
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(BOX_BORDER_RADIUS))),
                backgroundColor: MaterialStateProperty.all(SECONDARY_COLOR),
                padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
                fixedSize: MaterialStateProperty.all( 
                    Size((MediaQuery.of(context).size.width * HOMESCREEN_BTN_WIDTH_FACTOR), (MediaQuery.of(context).size.height * HOMESCREEN_BTN_HEIGHT_FACTOR)),
                )),
            onPressed: () {
              widget.onPressed();
              Navigator.of(context)
                  .pushNamed(widget.route, arguments: widget.args);
            }));
  }
}
