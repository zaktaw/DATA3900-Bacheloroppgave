import 'dart:async';

import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const String send_count = 'Send inn telling';
const String pick_name = "Velg navn";
const String send_failed = 'Sending feilet';
const String send_confirmed = 'Telling sendt';

//Bottombar for confirm-page. Logic to prevent user from submitting session if observers is not selected
class ConfirmBottombar extends StatefulWidget {
  Function getIsObserverSelected;
  Function sendTTT;

  ConfirmBottombar(this.getIsObserverSelected, this.sendTTT, {Key? key})
      : super(key: key) {
    getIsObserverSelected = this.getIsObserverSelected;
    sendTTT = this.sendTTT;
  }

  @override
  _ConfirmBottombarState createState() => _ConfirmBottombarState();
}

class _ConfirmBottombarState extends State<ConfirmBottombar> {
  late bool response;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: BOTTOMBAR_COLOR,
      child: InkWell(
        onTap: () async => {
          if (widget.getIsObserverSelected())
            {
              response = widget.sendTTT(),
              if (response)
                {
                  Fluttertoast.showToast(
                      msg: send_confirmed, // message
                      toastLength: Toast.LENGTH_SHORT, // length
                      gravity: ToastGravity.CENTER, // location
                      timeInSecForIosWeb: 4, // duration,
                      backgroundColor: TOAST_BACKGROUND_COLOR,
                      textColor: TOAST_TEXT_COLOR,
                      fontSize: TOAST_FONT_SIZE,
                      ),
                  //Give the user time to see confirmation message before redirecting to homescreen
                  await Future.delayed(const Duration(seconds: 2)),
                  (Navigator.of(context).pushNamed('/'))
                }
              else
                {
                  Fluttertoast.showToast(
                      msg: send_failed, // message
                      toastLength: Toast.LENGTH_SHORT, // length
                      gravity: ToastGravity.CENTER, // location
                      timeInSecForIosWeb: 4, // duration,
                      backgroundColor: TOAST_BACKGROUND_COLOR,
                      textColor: TOAST_TEXT_COLOR,
                      fontSize: TOAST_FONT_SIZE,
                      ),
                }
            }
          else
            {
              Fluttertoast.showToast(
                  msg: pick_name, // message
                  toastLength: Toast.LENGTH_SHORT, // length
                  gravity: ToastGravity.CENTER, // location
                  timeInSecForIosWeb: 4, // duration
                  backgroundColor: TOAST_BACKGROUND_COLOR,
                  textColor: TOAST_TEXT_COLOR,
                  fontSize: TOAST_FONT_SIZE,
                  ),
            }
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: const <Widget>[
              Text(send_count, style: TextStyle(color: TEXT_COLOR_BLACK, fontSize: COUNT_BOTTOMBAR_FONTSIZE)),
            ],
          ),
        ),
      ),
    );
  }
}
