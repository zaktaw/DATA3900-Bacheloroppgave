import 'package:bacheloroppgave/home_screen/homescreen_button.dart';
import 'package:bacheloroppgave/http_requests.dart';
import 'package:bacheloroppgave/local_storage_hive/TttProjectInfoBox.dart';
import 'package:bacheloroppgave/models/ActivityObject.dart';
import 'package:bacheloroppgave/models/TttEntries.dart';
import 'package:bacheloroppgave/models/TttProjectInfo.dart';
import 'package:bacheloroppgave/models/ZoneObject.dart';
import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:bacheloroppgave/settings_page/settings_help_topbar.dart';
import 'package:bacheloroppgave/zone_page/zone_card.dart';
import 'package:flutter/material.dart';
import 'package:bacheloroppgave/local_storage_hive/TttEntriesBox.dart';
import 'package:hive/hive.dart';

const String new_count = 'Ny telling';
const String continue_count = 'Gjenoppta telling';
const String settings = 'Innstilinger';
const String help = 'Hjelp';

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

  late Future<TttProjectInfo> futureTttProjectInfo;

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

    // get request for tttProjectInfo
    futureTttProjectInfo = HttpRequests.fetchTttProjectInfo();

    //MOCK Projectinfo init init
    ZoneObject zoneobj =
        new ZoneObject(1, "Ungdomsrommet 2.Etg", "Eget rom med ungdomsbøker");
    ZoneObject zoneobj1 =
        new ZoneObject(2, "Torget 2.Etg", "Mingleområde med sitteplasser");
    ZoneObject zoneobj2 = new ZoneObject(3, "Fantasia 2.Etg",
        "eget rom for småbarn/barnehager (inneholder ikke bøker, men kan fungere som f.eks lunsjsted eller base for barnehager/grupper)");

    ZoneObject zoneobj3 = new ZoneObject(4, "Gresseplasser 2.Etg",
        "Området mellom bokhyllene der folk går og gresser/snuser etter bøker");

    ZoneObject zoneobj4 =
        new ZoneObject(5, "Krimrommet 1.Etg", "Eget rom for krimbøker");

    ZoneObject zoneobj5 = new ZoneObject(6, "Lesesal 1.Etg", "Lesesal i 1.etg");

    ZoneObject zoneobj6 = new ZoneObject(7, "Sitteplasser 1.Etg",
        "Sitteplasser i 1. etg, gjelder ikke sitteplasser i kafeen");

    ZoneObject zoneobj7 = new ZoneObject(
        8, "Torget 1.Etg", "Mingelområde med inn- og utleveringsmulighteter");

    ZoneObject zoneobj8 = new ZoneObject(9, "Gresseplasser 1.Etg",
        "Området mellom bokhyllene der folk går og gresser/snuser etter bøker");

    ZoneObject zoneobj9 = new ZoneObject(
        10, "Musikkrommmet U.Etg", "Eget rom for musikksamlinger");

    ZoneObject zoneobj10 = new ZoneObject(
        11, "Sitteplasser U.Etg", "Sitteplasser langs ytterveggene");

    ZoneObject zoneobj11 = new ZoneObject(12, "Torget U.Etg",
        "Sceneomåde i underetasjen, består for det meste av sitteplasser");

    ZoneObject zoneobj12 = new ZoneObject(13, "Gresseplasser U.Etg",
        "Området mellom bokhyllene der folk går og gresser/snuser etter bøker");

    ZoneObject zoneobj13 = new ZoneObject(
        14, "Fleksible plasser (Studieverkstedet og Vepsebolet)", "Sone 14");

    ActivityObject actobj =
        new ActivityObject("ALLAP", "Alene med digitalt hjelpemiddel");

    ActivityObject actobj1 = new ActivityObject("GRLAP",
        "Sitter eller står i gruppe med bærbar(e) datamaskin(er) eller nettbrett slått på");

    ActivityObject actobj2 = new ActivityObject(
        "ALUDIG", "Sitter eller står alene og arbeider uten digitale medier");

    ActivityObject actobj3 = new ActivityObject("GRUDIG",
        "Sitter eller står i gruppe og arbeider uten digitale medier");

    ActivityObject actobj4 =
        new ActivityObject("ALPERS", "Individuell kontakt med personalet");

    ActivityObject actobj5 =
        new ActivityObject("GRPERS", "Gruppevis kontakt med personalet");

    ActivityObject actobj6 =
        new ActivityObject("ALFYS", "Kikker/browser alene");

    ActivityObject actobj7 =
        new ActivityObject("GRFYS", "Kikker/browser i gruppe");

    ActivityObject actobj8 = new ActivityObject(
        "ALPC", "Bruker stasjonær datamaskin eller søketerminal alene");

    ActivityObject actobj9 = new ActivityObject(
        "GRPC", "Bruker stasjonær datamaskin eller søketerminal i gruppe");

    ActivityObject actobj10 = new ActivityObject("KØ", "Venter i kø");

    ActivityObject actobj11 =
        new ActivityObject("MOB", "Snakker i mobiltelefon");

    ActivityObject actobj12 =
        new ActivityObject("ALGÅ", "Står eller går alene");

    ActivityObject actobj13 =
        new ActivityObject("GRGÅ", "Står eller går i gruppe");

    ActivityObject actobj14 = new ActivityObject("ALSI", "Sitter alene");

    ActivityObject actobj15 = new ActivityObject("GRSI", "Sitter i gruppe");

    ActivityObject actobj16 = new ActivityObject("DIV", " Andre aktiviteter");

    final tttProjectInfoBox = TttProjectInfoBox.getTttProjectInfo();
    List<ZoneObject> zoneList = [];
    zoneList.addAll([
      zoneobj,
      zoneobj1,
      zoneobj2,
      zoneobj3,
      zoneobj4,
      zoneobj5,
      zoneobj6,
      zoneobj7,
      zoneobj8,
      zoneobj9,
      zoneobj10,
      zoneobj11,
      zoneobj12
    ]);

    List<ActivityObject> actList = [];
    actList.addAll([
      actobj,
      actobj1,
      actobj2,
      actobj3,
      actobj4,
      actobj5,
      actobj6,
      actobj7,
      actobj8,
      actobj9,
      actobj10,
      actobj11,
      actobj12,
      actobj13,
      actobj14,
      actobj15,
      actobj16
    ]);

    List<String> observerList = ["Maria", "Hans", "Helene"];
    String title = "ToF bibliotek (testprosjekt)";

    TttProjectInfo projectInfo = new TttProjectInfo(
        activities: actList,
        zones: zoneList,
        observers: observerList,
        project_name: title);
    tttProjectInfoBox.add(projectInfo);
  }

  void newCount() {
    TttEntriesBox.getTttEntries().delete('tttEntriesMap');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Universitetsbiblioteket OsloMet P48 (test)"),
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
                    btnName: settings,
                    margin: HOMESCREEN_SETTINGS_BTN_MARGIN,
                    route: "/settings",
                    args: null,
                    onPressed: () => {}),
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
