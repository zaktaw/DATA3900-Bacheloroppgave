import 'dart:convert';

import 'package:bacheloroppgave/confirm_page/confirm_bottombar.dart';
import 'package:bacheloroppgave/confirm_page/confirm_count_reviewlist.dart';
import 'package:bacheloroppgave/http_requests.dart';
import 'package:bacheloroppgave/local_storage_hive/TttEntriesBox.dart';
import 'package:bacheloroppgave/models/TttObject.dart';
import 'package:bacheloroppgave/models/TttEntries.dart';
import 'package:bacheloroppgave/confirm_page/confirm_dropdown_names.dart';
import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:bacheloroppgave/settings_page/settings_help_topbar.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../local_storage_hive/TttProjectInfoBox.dart';
import '../models/TttProjectInfo.dart';

class ConfirmCount extends StatefulWidget {
  late TttEntries entries;

  ConfirmCount(this.entries, {Key? key}) : super(key: key) {
    entries = this.entries;
  }

  @override
  _ConfirmCountState createState() => _ConfirmCountState();
}

class _ConfirmCountState extends State<ConfirmCount> {
  late TttEntries entries;
  late int numberOfZones;
  late TttProjectInfo projectInfo;
  bool observerSelected = false;
  String observerName = '';

  @override
  void dispose() {
    Hive.box('tttProjectInfo').close();
    super.dispose();
  }

  @override
  void initState() {
    entries = widget.entries;
    projectInfo =
        TttProjectInfoBox.getTttProjectInfo().getAt(0) as TttProjectInfo;
    numberOfZones = projectInfo.zones.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: SettingsHelpTopBar("Bekreft telling", '/zones', entries),
      body: Container(
          child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              child: Padding(
            child: Text(
              "Du har telt " +
                  numberOfZones.toString() +
                  " av " +
                  numberOfZones.toString() +
                  " soner",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: CONFIRM_PAGE_REWIEWLIST_FONTSIZE),
            ),
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height *
                    CONFIRM_PAGE_HEADER_PADDING_TOP_FACTOR,
                bottom: MediaQuery.of(context).size.height *
                    CONFIRM_PAGE_HEADER_PADDING_BOTTOM_FACTOR),
          )),
          ConfirmReviewList(entries, projectInfo.zones),
          DropdownNames(
              setIsObserverSelected, setObserverName, projectInfo.observers),
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

  Future sendTTT() async {
    TttObject tttObject = TttObject(
        entries.tttEntries,
        observerName,
        entries.timestamp,
        projectInfo.activities,
        projectInfo.id,
        projectInfo.zones);
        
    String jsonBody = jsonEncode(tttObject);

    Future postRequest = HttpRequests.postTttObject(jsonBody);
    return postRequest;
  }

  void setObserverName(String selectedDropdownName) {
    observerName = selectedDropdownName;
  }
}
