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

  @override
  void initState() {
    tttEntries = TttEntries();
    final tttEntriesBox = TttEntriesBox.getTttEntries();
    tttEntriesBox.put('tttEntriesMap', tttEntries);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            //TODO: freestylah
            child: Center(
                child: Column(
      children: [
        Text("Main menu placeholder"),
        HomeScreenButton(
            btnName: "Ny telling", route: "/activity", args: [tttEntries, 0]),
        HomeScreenButton(
            btnName: "Innstillinger", route: "/settings", args: null),
        HomeScreenButton(btnName: "Hjelp", route: "/help", args: null),
        HomeScreenButton(
            btnName: "Bekreft", route: "/bekreft", args: tttEntries),
      ],
    ))));
  }
}
