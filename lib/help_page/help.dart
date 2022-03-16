import 'package:bacheloroppgave/help_page/help_about_TTT.dart';
import 'package:bacheloroppgave/help_page/help_about_activities.dart';
import 'package:bacheloroppgave/help_page/help_about_app.dart';
import 'package:bacheloroppgave/help_page/help_about_zones.dart';
import 'package:bacheloroppgave/settings_page/settings_help_topbar.dart';
import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);


  @override
  _HelpState createState() => _HelpState();
}

  class _HelpState extends State<Help> {
  int _selectedIndex = 0;
  
  static const List<Widget> _helpOptions = <Widget>[
    HelpTTT(),
    HelpApp(),
    HelpZones(),
    HelpActivites(),
  ];

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
        selectedItemColor: Color.fromARGB(255, 236, 7, 168),
        onTap: _onItemTapped,
      ),
    );
  }
}
