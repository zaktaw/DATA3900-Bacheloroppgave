import 'package:bacheloroppgave/home_screen/homescreen_button.dart';
import 'package:bacheloroppgave/local_storage_hive/TttProjectInfoBox.dart';
import 'package:bacheloroppgave/models/ActivityObject.dart';
import 'package:bacheloroppgave/models/TttEntries.dart';
import 'package:bacheloroppgave/models/TttProjectInfo.dart';
import 'package:bacheloroppgave/models/ZoneObject.dart';
import 'package:bacheloroppgave/zone_page/zone_card.dart';
import 'package:flutter/material.dart';
import 'package:bacheloroppgave/local_storage_hive/TttEntriesBox.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TttEntries tttEntries;
  late TttEntries activeTttEntries;
  late bool activeTtt;

  @override
  void initState() {
    tttEntries = TttEntries();
    final tttEntriesBox = TttEntriesBox.getTttEntries();
    if (tttEntriesBox.containsKey('tttEntriesMap')) {
      activeTttEntries = TttEntriesBox.getTttEntries().getAt(0) as TttEntries;
      activeTtt = true;
    } else {
      tttEntriesBox.put('tttEntriesMap', tttEntries);
      activeTtt = false;
    }

    //MOCK Projectinfo init init
    ZoneObject zoneobj =
        new ZoneObject(1, "Sone 1 Lesesal", "Lesesalen ved inngangen");
    ZoneObject zoneobj1 =
        new ZoneObject(2, "Sone 2 Lesekrok", "Hjørnet ved potteplantene");
    ZoneObject zoneobj2 =
        new ZoneObject(3, "Sone 3 Faglitteratur", "Området for faglitteratur");

    ActivityObject actobj =
        new ActivityObject("ALLAP", "Alene med digitalt hjelpemiddel");
    ActivityObject actobj1 =
        new ActivityObject("GRUDIG", "I gruppe med digitalt hjelpemiddel");
    ActivityObject actobj2 =
        new ActivityObject("ALPERS", "Alene kontakt med personalet");

    final tttProjectInfoBox = TttProjectInfoBox.getTttProjectInfo();
    List<ZoneObject> zoneList = [];
    zoneList.addAll([zoneobj, zoneobj1, zoneobj2]);

    List<ActivityObject> actList = [];
    actList.addAll([actobj, actobj1, actobj2]);

    List<String> observerList = ["Hans", "Zaka", "Mats", "Petrus"];
    String title = "Tønsberg Folkebibiliotek TTT 2022";

    TttProjectInfo projectInfo =
        new TttProjectInfo(actList, zoneList, observerList, title);
    tttProjectInfoBox.add(projectInfo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            //TODO: freestylah
            child: Center(
                child: Column(
      children: [
        const Text("Main menu placeholder"),
        HomeScreenButton(
            btnName: "Ny telling", route: "/activity", args: [tttEntries, 0]),
        activeTtt
            ? HomeScreenButton(
                btnName: 'Gjenoppta telling',
                route: '/zones',
                args: activeTttEntries)
            : const SizedBox.shrink(),
        const HomeScreenButton(
            btnName: "Innstillinger", route: "/settings", args: null),
        const HomeScreenButton(btnName: "Hjelp", route: "/help", args: null),
        HomeScreenButton(
            btnName: "Bekreft", route: "/bekreft", args: tttEntries),
      ],
    ))));
  }
}