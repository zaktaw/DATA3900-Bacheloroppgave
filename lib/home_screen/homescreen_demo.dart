import 'package:bacheloroppgave/home_screen/confirm_count_pop.dart';
import 'package:bacheloroppgave/home_screen/homescreen_button.dart';
import 'package:bacheloroppgave/local_storage_hive/TttProjectInfoBox.dart';
import 'package:bacheloroppgave/models/ActivityObject.dart';
import 'package:bacheloroppgave/models/TttEntries.dart';
import 'package:bacheloroppgave/models/TttProjectInfo.dart';
import 'package:bacheloroppgave/models/ZoneObject.dart';
import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:bacheloroppgave/resources/mock_db.dart';
import 'package:flutter/material.dart';
import 'package:bacheloroppgave/local_storage_hive/TttEntriesBox.dart';
import 'package:hive/hive.dart';

const String new_count = 'Ny telling';
const String continue_count = 'Gjenoppta telling';
const String settings = 'Innstilinger';
const String help = 'Hjelp';

//Displays homescreen with logic for starting and/or resuming counting sessions
class HomeScreenDemo extends StatefulWidget {
  const HomeScreenDemo({Key? key}) : super(key: key);

  @override
  _HomeScreenDemoState createState() => _HomeScreenDemoState();
}

class _HomeScreenDemoState extends State<HomeScreenDemo> {
  late TttEntries tttEntries;
  late TttEntries activeTttEntries;
  late bool activeTtt;
  late Box tttEntriesBox;
  late TttProjectInfoBox tttProjectInfoBox;

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

    final tttProjectInfoBox = TttProjectInfoBox.getTttProjectInfo();
    tttProjectInfoBox.add(getMockDb());
  }

  //Remove session if a new session is started
  void newCount() {
    TttEntriesBox.getTttEntries().delete('tttEntriesMap');
  }

  String getProjectName() {
    TttProjectInfo info =
        TttProjectInfoBox.getTttProjectInfo().getAt(0) as TttProjectInfo;
    return info.project_name.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(getProjectName()),
          centerTitle: true,
          backgroundColor: TOPBAR_COLOR,
          titleTextStyle: const TextStyle(
              color: TEXT_COLOR_BLACK, fontSize: HOMESCREEN_TITLE_FONTSIZE),
          toolbarHeight: (MediaQuery.of(context).size.height *
              HOMESCREEN_TOPBAR_HEIGHT_FACTOR),
          automaticallyImplyLeading: false,
        ),
        body: Container(
            decoration: const BoxDecoration(color: BACKGROUND_COLOR),
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
                        routeEnabled: true,
                      ),
                activeTtt
                    ? HomeScreenButton(
                        btnName: continue_count,
                        margin: HOMESCREEN_RESUME_COUNT_BTN_MARGIN,
                        route: '/zones',
                        args: activeTttEntries,
                        onPressed: () => {},
                        routeEnabled: true,
                      )
                    : const SizedBox.shrink(),
                HomeScreenButton(
                    btnName: help,
                    margin: HOMESCREEN_HELP_BTN_MARGIN,
                    route: "/help",
                    args: null,
                    onPressed: () => {},
                    routeEnabled: true),
                HomeScreenButton(
                    btnName: settings,
                    route: "/settings",
                    margin: HOMESCREEN_SETTINGS_BTN_MARGIN,
                    args: null,
                    onPressed: () => {},
                    routeEnabled: true)
              ],
            ))));
  }
}
