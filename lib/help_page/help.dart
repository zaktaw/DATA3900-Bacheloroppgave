import 'package:bacheloroppgave/help_page/help_about_TTT.dart';
import 'package:bacheloroppgave/help_page/help_about_activities.dart';
import 'package:bacheloroppgave/help_page/help_about_app.dart';
import 'package:bacheloroppgave/help_page/help_about_zones.dart';
import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:bacheloroppgave/settings_page/settings_help_topbar.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../local_storage_hive/TttProjectInfoBox.dart';
import '../models/TttProjectInfo.dart';

class Help extends StatefulWidget {
  Help({Key? key}) : super(key: key);

  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  int _selectedIndex = 0;
  late TttProjectInfo projectInfo =
      TttProjectInfoBox.getTttProjectInfo().getAt(0) as TttProjectInfo;
  late List<Widget> _helpOptions;

  @override
  void dispose() {
    Hive.box('tttProjectInfo').close();
    super.dispose();
  }

  @override
  void initState() {
    projectInfo =
        TttProjectInfoBox.getTttProjectInfo().getAt(0) as TttProjectInfo;

  _helpOptions = <Widget>[
      const HelpTTT(),
      const HelpApp(),
      HelpZones(projectInfo),
      HelpActivites(projectInfo),
    ];
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingsHelpTopBar("Hjelp", '/', null),
      body: Center(
        child: _helpOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: SECONDARY_COLOR,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.find_in_page),
            label: 'TTT',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone_android),
            label: 'Applikasjonen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_rounded),
            label: 'Soner',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervisor_account),
            label: 'Aktiviteter',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: TEXT_COLOR_BLACK,
        onTap: _onItemTapped,
      ),
    );
  }
}
