import 'package:bacheloroppgave/settings_page/settings_help_topbar.dart';
import 'package:flutter/material.dart';

const String settings = 'Innstillinger';
const String settings_text = 'Innstillinger placeholder';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SettingsHelpTopBar(settings, '/', null),
        body: Container(child: const Text(settings_text)));
  }
}
