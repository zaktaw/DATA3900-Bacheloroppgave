import 'package:bacheloroppgave/activity_bottombar.dart';
import 'package:bacheloroppgave/models/tellinger.dart';
import 'package:bacheloroppgave/settings_help_topbar.dart';
import 'package:flutter/material.dart';

class ConfirmCount extends StatefulWidget {
  late Tellinger data;

  ConfirmCount(this.data, {Key? key}) : super(key: key) {
    data = this.data;
  }

  @override
  _ConfirmCountState createState() => _ConfirmCountState();
}

class _ConfirmCountState extends State<ConfirmCount> {
  late Tellinger data;
  late String numberOfZones;

  @override
  void initState() {
    data = widget.data;
    numberOfZones = data.getNumberOfZone().toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingsHelpTopBar("Bekreft telling"),
      body: Container(
          child: Column(
        children: [
          Text("Du har telt " +
              numberOfZones +
              " av " +
              numberOfZones +
              " soner"),
        ],
      )),
      bottomNavigationBar: null,
    );
  }
}
