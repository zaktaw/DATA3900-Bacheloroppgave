import 'dart:async';

import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:bacheloroppgave/local_storage_hive/TttEntriesBox.dart';

const String send_count = 'Send inn telling';
const String pick_name = "Velg navn";
const String send_failed = 'Sending feilet';
const String send_confirmed = 'Telling sendt';
const String sending = 'Sender telling...';
final String SENT_FAIL_UNATHORIZED = "Sending feilet, ugyldig token";


/// Bottombar for confirm-page. Triggers post-request for posting count to server. 
/// Navigates to homescreen when count is sent or stored in local storage (Hive). Checks if user is autorized when request is sent
/// Redirects to login if user is not autorized (eg. expired token)
class ConfirmBottombar extends StatefulWidget {
  Function sendTTT;

  ConfirmBottombar(this.sendTTT, {Key? key}) : super(key: key) {
    sendTTT = this.sendTTT;
  }

  @override
  _ConfirmBottombarState createState() => _ConfirmBottombarState();
}

class _ConfirmBottombarState extends State<ConfirmBottombar> {
  late Future response;
  bool enabled = true;

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
          if (enabled) {
            enabled = false,
            Fluttertoast.showToast(
            msg: sending, // message
            toastLength: Toast.LENGTH_SHORT, // length
            gravity: ToastGravity.CENTER, // location
            timeInSecForIosWeb: 1, // duration,
            backgroundColor: TOAST_BACKGROUND_COLOR,
            textColor: TOAST_TEXT_COLOR,
            fontSize: TOAST_FONT_SIZE,
          ),
          response = widget.sendTTT(),
          response.then((value) async => {
                Fluttertoast.showToast(
                  msg: value, // message
                  toastLength: Toast.LENGTH_SHORT, // length
                  gravity: ToastGravity.CENTER, // location
                  timeInSecForIosWeb: 4, // duration,
                  backgroundColor: TOAST_BACKGROUND_COLOR,
                  textColor: TOAST_TEXT_COLOR,
                  fontSize: TOAST_FONT_SIZE,
                ),

                /// Give the user time to see confirmation message before redirecting to homescreen
                await Future.delayed(const Duration(seconds: 2)),
                /// Redirect to log-in if unathorized
                if (value == SENT_FAIL_UNATHORIZED) {
                  (Navigator.of(context).pushNamed('/login'))
                }
                /// Redirct to homescreen, count is posted to server or stored in Hive if unsuccesful
                else {
                  (Navigator.of(context).pushNamed('/homescreen'))
                }                
              }),
          }
          
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: const <Widget>[
              Text(send_count,
                  style: TextStyle(
                      color: TEXT_COLOR_BLACK,
                      fontSize: COUNT_BOTTOMBAR_FONTSIZE)),
            ],
          ),
        ),
      ),
    );
  }
}
