import 'package:flutter/material.dart';

class ConfirmBottombar extends StatefulWidget {
  Function getIsObserverSelected;

  ConfirmBottombar(this.getIsObserverSelected, {Key? key}) : super(key: key) {
    getIsObserverSelected = this.getIsObserverSelected;
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
        onTap: () => null,
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
