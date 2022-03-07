import 'package:bacheloroppgave/settings_help_topbar.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);


  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingsHelpTopBar("Innstillinger", '/'),
      body: Container(
        child: const Text("Settings placeholder")
      ) 
    );
  }
}
