import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ConfirmBottombar extends StatefulWidget {
  Function getIsObserverSelected;
  String sendTTT;

  ConfirmBottombar(this.getIsObserverSelected, this.sendTTT, {Key? key})
      : super(key: key) {
    getIsObserverSelected = this.getIsObserverSelected;
    sendTTT = this.sendTTT;
  }

  @override
  _ConfirmBottombarState createState() => _ConfirmBottombarState();
}

class _ConfirmBottombarState extends State<ConfirmBottombar> {
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
        onTap: () => widget.getIsObserverSelected()
            ? Fluttertoast.showToast(
                msg: widget.sendTTT, // message
                toastLength: Toast.LENGTH_SHORT, // length
                gravity: ToastGravity.CENTER, // location
                timeInSecForIosWeb: 3) // duration,

            : Fluttertoast.showToast(
                msg: widget.sendTTT, // message
                toastLength: Toast.LENGTH_SHORT, // length
                gravity: ToastGravity.CENTER, // location
                timeInSecForIosWeb: 3 // duration,
                ),
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
