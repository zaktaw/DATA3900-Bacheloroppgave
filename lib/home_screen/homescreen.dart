import 'dart:async';

import 'package:bacheloroppgave/home_screen/confirm_count_pop.dart';
import 'package:bacheloroppgave/home_screen/homescreen_button.dart';
import 'package:bacheloroppgave/http_requests.dart';
import 'package:bacheloroppgave/local_storage_hive/TttProjectInfoBox.dart';
import 'package:bacheloroppgave/models/TttEntries.dart';
import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:bacheloroppgave/resources/keys.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:bacheloroppgave/local_storage_hive/TttEntriesBox.dart';
import 'package:hive/hive.dart';

const String project_title_error = "Kunne ikke hente prosjekt-tittel";
const String new_count = 'Ny telling';
const String continue_count = 'Gjenoppta telling';
const String settings = 'Innstilinger';
const String help = 'Hjelp';
const String TOKEN = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9';

/// Displays homescreen with logic for starting and/or resumeing counting sessions
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TttEntries tttEntries;
  late TttEntries activeTttEntries;
  late bool activeTtt;
  late Box tttEntriesBox;
  late List activities;
  late List zones;
  String projectName = "Kunne ikke hente prosjektinfo";
  late StreamSubscription subscription;

  @override
  void initState() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result != ConnectivityResult.none) {
        HttpRequests.sendUnsentTttObjects();
        getProjectInfo();
      }
    });

    //Check if there is a active session or not. Used to control if option to resume session should be displayed
    tttEntries = TttEntries();
    tttEntriesBox = TttEntriesBox.getTttEntries();
    if (tttEntriesBox.containsKey('tttEntriesMap')) {
      activeTttEntries = TttEntriesBox.getTttEntries().getAt(0) as TttEntries;
      activeTtt = true;
    } else {
      activeTtt = false;
    }

    if (TttProjectInfoBox.getTttProjectInfo().isNotEmpty) {
      setState(() {
        projectName = TttProjectInfoBox.getTttProjectInfo()
            .get(projectInfoKey)!
            .project_name;
      });
    }
  }

  @override
  dispose() {
    super.dispose();

    subscription.cancel();
  }

  getProjectInfo() async {
  
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      final tttProjectInfoBox = TttProjectInfoBox.getTttProjectInfo();

      // get request for tttProjectInfo
      Future futureTttProjectInfo = HttpRequests.fetchTttProjectInfo();

      futureTttProjectInfo.then((statusCode) => {
        if (statusCode == 200) {
          setState(() => {
            projectName = TttProjectInfoBox.getTttProjectInfo()
            .get(projectInfoKey)!
            .project_name
          })
        }
      });
      
    
    } else {
      setState(() {
        projectName = "Ingen internettkobling";
      });
    }
  }

  /// Remove session if a new session is started
  void newCount() {
    TttEntriesBox.getTttEntries().delete('tttEntriesMap');
  }

  bool hasInfo() {
    return TttProjectInfoBox.getTttProjectInfo().isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(projectName),
          centerTitle: true,
          backgroundColor: TOPBAR_COLOR,
          titleTextStyle: const TextStyle(
              color: TEXT_COLOR_BLACK, fontSize: HOMESCREEN_TITLE_FONTSIZE),
          toolbarHeight: (MediaQuery.of(context).size.height *
              HOMESCREEN_TOPBAR_HEIGHT_FACTOR),
          automaticallyImplyLeading: false,
        ),
        body: Container(
            decoration: new BoxDecoration(color: BACKGROUND_COLOR),
            child: Center(
                child: Column(
              children: [
                activeTtt
                    ? ConfirmCountPop([tttEntries, 0], newCount)
                    : HomeScreenButton(
                        btnName: new_count,
                        margin: HOMESCREEN_COUNT_BTN_MARGIN,
                        route: "/activity",
                        args: [tttEntries, 0],
                        onPressed: newCount,
                        hasInfo: hasInfo),
                activeTtt
                    ? HomeScreenButton(
                        btnName: continue_count,
                        margin: HOMESCREEN_RESUME_COUNT_BTN_MARGIN,
                        route: '/zones',
                        args: activeTttEntries,
                        onPressed: () => {},
                        hasInfo: hasInfo,
                      )
                    : const SizedBox.shrink(),
                HomeScreenButton(
                  btnName: help,
                  margin: HOMESCREEN_HELP_BTN_MARGIN,
                  route: "/help",
                  args: null,
                  onPressed: () => {},
                  hasInfo: hasInfo,
                ),
                HomeScreenButton(
                  btnName: settings,
                  route: "/settings",
                  margin: HOMESCREEN_SETTINGS_BTN_MARGIN,
                  args: null,
                  onPressed: () => {},
                  hasInfo: () => true,
                )
              ],
            ))));
  }
}
