import 'package:bacheloroppgave/resources/app_string.dart';
import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpTTT extends StatelessWidget {
  const HelpTTT({ Key? key }) : super(key: key);

   @override
  Widget build(BuildContext context) {
   return Container(height: MediaQuery.of(context).size.height * HELP_BOX_MARGIN_FACTOR, width: MediaQuery.of(context).size.width * HELP_BOX_MARGIN_FACTOR,
      decoration: BoxDecoration(
          boxShadow: SHADOW_HELPSETTINGS_CONTAINER,
          color: BACKGROUND_TEXT_COLOR,
          borderRadius: BorderRadius.circular(BOX_BORDER_RADIUS)),
        child: ListView(
          children: [
            Text(HELP_TTT_TITLE, textAlign: TextAlign.center, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Padding(padding: EdgeInsets.all(15), child: Text(HELP_TTT_CONTENT)),
            Padding(padding: EdgeInsets.all(15), child: new InkWell(
              child: new Text(HELP_TTT_LINK_TEXT, style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline)),
              onTap: () => launch(HELP_TTT_LINK),
            )),
          ],
        ),
      );
  }
}