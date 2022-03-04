import 'package:bacheloroppgave/confirm_page/confirm_bottombar.dart';
import 'package:bacheloroppgave/confirm_page/confirm_count_reviewlist.dart';
import 'package:bacheloroppgave/models/TttObject.dart';
import 'package:bacheloroppgave/models/tellinger.dart';
import 'package:bacheloroppgave/confirm_page/confirm_dropdown_names.dart';
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
  bool observerSelected = false;

  @override
  void initState() {
    data = widget.data;
    numberOfZones = data.getNumberOfZone().toString();

    TttObject tttObject = TttObject(
        data.tellinger, 'Alf', ['GRUDIG', 'ALPERS', 'ALLAP', 'DIV', 'ALLUDIG']);
    tttObject.showTellinger();
    print(tttObject.name);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: SettingsHelpTopBar("Bekreft telling"),
      body: Container(
          child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Du har telt " +
              numberOfZones +
              " av " +
              numberOfZones +
              " soner"),
          ConfirmReviewList(data),
          DropdownNames(setIsObserverSelected),
        ],
      )),
      bottomNavigationBar: ConfirmBottombar(getIsObserverSelected, sendTTT()),
    ));
  }

  void setIsObserverSelected() {
    observerSelected = true;
  }

  bool getIsObserverSelected() {
    return observerSelected;
  }

  String sendTTT() {
    TttObject tttObject = TttObject(
        data.tellinger, 'Alf', ['GRUDIG', 'ALPERS', 'ALLAP', 'DIV', 'ALLUDIG']);
    tttObject.showTellinger();
    print(tttObject.name);
    return "feil";
  }
}
