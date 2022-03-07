import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      color: Colors.black12,
      child: InkWell(
        onTap: () async => {
          if(widget.getIsObserverSelected()) {
            response = widget.sendTTT(),
            
            if(response) {
              Fluttertoast.showToast(
                msg: "Telling sendt", // message
                toastLength: Toast.LENGTH_SHORT, // length
                gravity: ToastGravity.CENTER, // location
                timeInSecForIosWeb: 3 // duration,
                ),
                //Give the user time to see confirmation message before redirecting to homescreen
                await Future.delayed(const Duration(seconds: 2)), (Navigator.of(context).pushNamed('/'))
            } else {
              Fluttertoast.showToast(
                msg: "Sending feilet", // message
                toastLength: Toast.LENGTH_SHORT, // length
                gravity: ToastGravity.CENTER, // location
                timeInSecForIosWeb: 3 // duration,
                ),
            }
          } 
          else {
            Fluttertoast.showToast(
                msg: "Velg navn", // message
                toastLength: Toast.LENGTH_SHORT, // length
                gravity: ToastGravity.CENTER, // location
                timeInSecForIosWeb: 3 // duration,
                ),
          }
          
        },
        child: Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Column(
            children: <Widget>[
              Text('Send inn telling', style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
      ),
    );
  }
}
