import 'package:bacheloroppgave/home_screen/confirm_count_pop.dart';
import 'package:bacheloroppgave/home_screen/homescreen_button.dart';
import 'package:bacheloroppgave/http_requests.dart';
import 'package:bacheloroppgave/local_storage_hive/TttProjectInfoBox.dart';
import 'package:bacheloroppgave/models/ActivityObject.dart';
import 'package:bacheloroppgave/models/TttEntries.dart';
import 'package:bacheloroppgave/models/TttProjectInfo.dart';
import 'package:bacheloroppgave/models/User.dart';
import 'package:bacheloroppgave/models/UserBox.dart';
import 'package:bacheloroppgave/models/UserToken.dart';
import 'package:bacheloroppgave/models/ZoneObject.dart';
import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:bacheloroppgave/local_storage_hive/TttEntriesBox.dart';
import 'package:hive/hive.dart';
import 'dart:io';
import 'dart:math';

const String project_title_error = "Kunne ikke hente prosjekt-tittel";
const String new_count = 'Ny telling';
const String continue_count = 'Gjenoppta telling';
const String settings = 'Innstilinger';
const String help = 'Hjelp';
const String TOKEN = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9';

//Displays homescreen with logic for starting and/or resuming counting sessions
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
  late String projectName;

  late Future<TttProjectInfo> futureTttProjectInfo;

  //Check if there is a active session or not. Used to control if option to resume session should be displayed
  @override
  void initState() {
    tttEntries = TttEntries();
    tttEntriesBox = TttEntriesBox.getTttEntries();
    if (tttEntriesBox.containsKey('tttEntriesMap')) {
      activeTttEntries = TttEntriesBox.getTttEntries().getAt(0) as TttEntries;
      activeTtt = true;
    } else {
      activeTtt = false;
    }

    // save user object
    final User user = User(1, 'Hans', TOKEN);
    final userHiveBox = UserBox.getUser();
    userHiveBox.add(user);

    // save user token
    UserToken.setUserToken(TOKEN);

    final tttProjectInfoBox = TttProjectInfoBox.getTttProjectInfo();

    tttProjectInfoBox.clear();

    // get request for tttProjectInfo
    futureTttProjectInfo = HttpRequests.fetchTttProjectInfo();

    futureTttProjectInfo.then((value) {
      projectName = value.project_name;
      TttProjectInfo projectInfo = TttProjectInfo(
          project_name: value.project_name,
          description: value.description,
          activities: value.activities,
          zones: value.zones,
          observers: value.observers,
          id: value.id);
      tttProjectInfoBox.add(projectInfo);
    });
  }

  //Remove session if a new session is started
  void newCount() {
    TttEntriesBox.getTttEntries().delete('tttEntriesMap');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: FutureBuilder<TttProjectInfo>(
              future: futureTttProjectInfo,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!.project_name);
                } else if (snapshot.hasError) {
                  return Text(project_title_error);
                }
                return const CircularProgressIndicator();
              }),
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
                HomeScreenButton(
                    btnName: new_count,
                    margin: HOMESCREEN_COUNT_BTN_MARGIN,
                    route: "/activity",
                    args: [tttEntries, 0],
                    onPressed: newCount),
                activeTtt
                    ? HomeScreenButton(
                        btnName: continue_count,
                        margin: HOMESCREEN_RESUME_COUNT_BTN_MARGIN,
                        route: '/zones',
                        args: activeTttEntries,
                        onPressed: () => {},
                      )
                    : const SizedBox.shrink(),
                HomeScreenButton(
                    btnName: help,
                    margin: HOMESCREEN_HELP_BTN_MARGIN,
                    route: "/help",
                    args: null,
                    onPressed: () => {}),
              ],
            ))));
  }
}
