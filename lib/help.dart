import 'package:bacheloroppgave/settings_page/settings_help_topbar.dart';
import 'package:flutter/material.dart';

const String help_title = "Hjelp";
const String help_text = "Hjelp siden sin placeholder";

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SettingsHelpTopBar(help_title, '/', null),
        body: Container(child: const Text(help_text)));
  }
}
