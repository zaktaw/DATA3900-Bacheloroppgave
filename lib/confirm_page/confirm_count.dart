import 'dart:convert';

import 'package:bacheloroppgave/confirm_page/confirm_bottombar.dart';
import 'package:bacheloroppgave/confirm_page/confirm_count_reviewlist.dart';
import 'package:bacheloroppgave/http_requests.dart';
import 'package:bacheloroppgave/local_storage_hive/TttEntriesBox.dart';
import 'package:bacheloroppgave/local_storage_hive/UnsentTttEntriesBox.dart';
import 'package:bacheloroppgave/models/TttObject.dart';
import 'package:bacheloroppgave/models/TttEntries.dart';
import 'package:bacheloroppgave/models/User.dart';
import 'package:bacheloroppgave/local_storage_hive/UserBox.dart';
import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../confirm_and_help_topbar/confirm_and_help_topbar.dart';
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
  late User user;
  final String NAME_TEXT = "Telling utført av: ";
  final String SENT_OK = "Telling sendt";
  final String SENT_FAIL = "Sending feilet";
  final String SENT_FAIL_NO_INTERNET = "Sending feilet. Mangler internett.";

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
    user = UserBox.getUser().getAt(0) as User;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: ConfirmAndHelpTopBar("Bekreft telling", '/zones', entries),
      body: Container(
          child: Column(
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
          Text(NAME_TEXT + user.name),
        ],
      )),
      bottomNavigationBar: ConfirmBottombar(sendTTT),
    );
  }

  Future<String> sendTTT() async {
    TttObject tttObject = TttObject(
        entries.tttEntries,
        user.name,
        entries.timestamp,
        projectInfo.activities,
        projectInfo.id,
        projectInfo.zones);

    TttEntriesBox.getTttEntries().delete('tttEntriesMap');

    final unsentTttEntriesBox = UnsentTttEntriesBox.getTttEntries();
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      String jsonBody = jsonEncode(tttObject);

      int statusCode = await HttpRequests.postTttObject(jsonBody);
   
      if (statusCode == 200) {
        return SENT_OK;
      } else {
        unsentTttEntriesBox.add(tttObject);
        return SENT_FAIL;
      }
    } else {
      unsentTttEntriesBox.add(tttObject);
      return SENT_FAIL_NO_INTERNET;
    }
  }
}
