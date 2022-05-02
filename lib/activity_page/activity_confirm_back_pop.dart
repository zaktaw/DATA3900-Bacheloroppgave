import 'package:bacheloroppgave/local_storage_hive/TttEntriesBox.dart';
import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:bacheloroppgave/zone_page/zones_list.dart';
import 'package:flutter/material.dart';
import 'package:bacheloroppgave/hero_dialog_route.dart';

import '../models/TttEntries.dart';
import 'package:bacheloroppgave/resources/app_theme.dart';

import '../zone_page/zone.dart';

//Koden er basert på kildekode fra https://github.com/funwithflutter/flutter_ui_tips/tree/master/tip_003_popup_card

const String pop_title = 'Advarsel';
const String pop_info = 'Vil du sende inn en tom zone?';

const String _heroConfirmPop = 'confirm-back-pop';

class PopActivityConfirmBackPop extends StatelessWidget {
  PopActivityConfirmBackPop(this.entries, this.zoneIndex, {Key? key})
      : super(key: key);

  TttEntries entries;
  int zoneIndex;
  final tttEntries = TttEntriesBox.getTttEntries();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: _heroConfirmPop,
          child: Material(
            color: Color.fromARGB(255, 82, 82, 82),
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(pop_title,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 5, bottom: 10, left: 20, right: 20),
                      child: const Divider(color: Colors.white, height: 5),
                    ),
                    const Text(
                      pop_info,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    Container(
                        margin: const EdgeInsets.only(
                            top: HOMESCREEN_POP_BUTTON_MARGIN),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {
                                  entries.addZoneKey(zoneIndex);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Zone(entries)));
                                  tttEntries.put('tttEntriesMap', entries);
                                },
                                child: const Text('JA')),
                            TextButton(
                                onPressed: () {
                                  print("deez nutz");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Zone(entries)));
                                },
                                child: const Text('NEI'))
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
