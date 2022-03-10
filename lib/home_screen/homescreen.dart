import 'package:bacheloroppgave/home_screen/homescreen_button.dart';
import 'package:bacheloroppgave/models/TttEntries.dart';
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
        ? HomeScreenButton(btnName: 'Gjenoppta telling', route: '/zones', args: activeTttEntries)
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
