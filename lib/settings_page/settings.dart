import 'package:bacheloroppgave/resources/app_theme.dart';
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
        body: Container(color: BACKGROUND_COLOR, child: Center(child: Container(
        height: MediaQuery.of(context).size.height * HELP_BOX_MARGIN_FACTOR, 
        width: MediaQuery.of(context).size.width * HELP_BOX_MARGIN_FACTOR,
       decoration: BoxDecoration(
          boxShadow: SHADOW_HELPSETTINGS_CONTAINER,
          color: BACKGROUND_TEXT_COLOR,
          borderRadius: BorderRadius.circular(BOX_BORDER_RADIUS)),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(15), child: Text("Tittel")),
          ],
        ),
      ),),)
      );
  }
}
