import 'package:bacheloroppgave/local_storage_hive/TttProjectInfoBox.dart';
import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../local_storage_hive/UserBox.dart';

const double buttonWidth = 250;

//Widget for buttons in homescreen with navigation based on args
class HomeScreenButton extends StatefulWidget {
  HomeScreenButton({
    Key? key,
    required this.btnName,
    required this.route,
    required this.margin,
    required this.args,
    required this.onPressed,
    required this.hasInfo,
  }) : super(key: key);

  final String btnName;
  final String route;
  final double margin;
  final args;
  Function onPressed;
  final Function hasInfo;

  @override
  _HomeScreenButtonState createState() => _HomeScreenButtonState();
}

class _HomeScreenButtonState extends State<HomeScreenButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: SHADOW_HOMESCREEN_BTN,
        margin: EdgeInsets.only(top: widget.margin),
        child: ElevatedButton(
            child: Text(
              widget.btnName,
              style: const TextStyle(
                  color: TEXT_COLOR_BLACK,
                  fontSize: HOMESCREEN_BTN_FONTSIZE,
                  fontWeight: FontWeight.bold),
            ),
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(BOX_BORDER_RADIUS))),
                backgroundColor:
                    MaterialStateProperty.all(HOMESCREEN_BUTTONS_COLOR),
                padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
                fixedSize: MaterialStateProperty.all(
                  Size(
                      (MediaQuery.of(context).size.width *
                          HOMESCREEN_BTN_WIDTH_FACTOR),
                      (MediaQuery.of(context).size.height *
                          HOMESCREEN_BTN_HEIGHT_FACTOR)),
                )),
            onPressed: () {
              widget.onPressed();
              if (widget.hasInfo()) {
                Navigator.of(context)
                    .pushNamed(widget.route, arguments: widget.args);
              } else {
                Fluttertoast.showToast(
                  msg: "Kunne ikke hente prosjektinfo", // message
                  toastLength: Toast.LENGTH_SHORT, // length
                  gravity: ToastGravity.CENTER, // location
                  timeInSecForIosWeb: 4, // duration,
                  backgroundColor: TOAST_BACKGROUND_COLOR,
                  textColor: TOAST_TEXT_COLOR,
                  fontSize: TOAST_FONT_SIZE,
                );
              }
            }));
  }
}
