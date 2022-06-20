import 'package:bacheloroppgave/local_storage_hive/TttEntriesBox.dart';
import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:flutter/material.dart';
import '../models/TttEntries.dart';
import '../zone_page/zone.dart';

//Code based on sourcecode from: https://github.com/funwithflutter/flutter_ui_tips/tree/master/tip_003_popup_card

const String pop_title = 'Advarsel';
const String pop_info = 'Vil du lagre en tom sone?';

const String _heroConfirmPop = 'confirm-back-pop';

/// Pop-up conformation box to confirm if user wants to commit an empty zone when navigation from activity without input
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
