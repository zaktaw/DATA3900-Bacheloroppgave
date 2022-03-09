import 'package:bacheloroppgave/confirm_page/confirm_bottombar.dart';
import 'package:bacheloroppgave/confirm_page/confirm_count_reviewlist.dart';
import 'package:bacheloroppgave/local_storage_hive/TttEntriesBox.dart';
import 'package:bacheloroppgave/models/TttObject.dart';
import 'package:bacheloroppgave/models/TttEntries.dart';
import 'package:bacheloroppgave/confirm_page/confirm_dropdown_names.dart';
import 'package:bacheloroppgave/settings_page/settings_help_topbar.dart';
import 'package:flutter/material.dart';

class ConfirmCount extends StatefulWidget {
  late TttEntries data;

  ConfirmCount(this.data, {Key? key}) : super(key: key) {
    data = this.data;
  }

  @override
  _ConfirmCountState createState() => _ConfirmCountState();
}

class _ConfirmCountState extends State<ConfirmCount> {
  late TttEntries data;
  late String numberOfZones;
  bool observerSelected = false;
  String observerName = '';

  @override
  void initState() {
    data = widget.data;
    numberOfZones = data.getNumberOfZones().toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingsHelpTopBar("Bekreft telling", '/zones', data),
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
          DropdownNames(setIsObserverSelected, setObserverName),
        ],
      )),
      bottomNavigationBar: ConfirmBottombar(getIsObserverSelected, sendTTT),
    );
  }

  void setIsObserverSelected() {
    observerSelected = true;
  }

  bool getIsObserverSelected() {
    return observerSelected;
  }

  bool sendTTT() {
    TttObject tttObject = TttObject(data.tttEntries, observerName,
        ['GRUDIG', 'ALPERS', 'ALLAP', 'DIV', 'ALLUDIG']);
    // kall på backend
    // if good return good
     TttEntries test = TttEntriesBox.getTttEntries().getAt(0) as TttEntries;
    print("1: Her er riktig print ellernoe sånt.. YES! ");
    test.showTellinger();
    TttEntriesBox.getTttEntries().delete('tttEntriesMap');
    // else return not good
    //Not good
   
    //tttObject.showTellinger();
    return true;
  }

  void setObserverName(String selectedDropdownName) {
    observerName = selectedDropdownName;
  }
}
