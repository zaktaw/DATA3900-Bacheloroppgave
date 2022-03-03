import 'package:bacheloroppgave/settings_help_topbar.dart';
import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);


  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingsHelpTopBar("Hjelp"),
      body: Container(
        child: const Text("Help placeholder")
      ) 
    );
  }
}
