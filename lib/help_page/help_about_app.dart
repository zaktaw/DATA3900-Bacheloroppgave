import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:flutter/material.dart';

class HelpApp extends StatelessWidget {
  const HelpApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Container(height: MediaQuery.of(context).size.height * HELP_BOX_MARGIN_FACTOR, width: MediaQuery.of(context).size.width * HELP_BOX_MARGIN_FACTOR,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(BOX_BORDER_RADIUS)),
        child: ListView(
          children: [
            Padding(padding: EdgeInsets.all(15), child: Text("Tittel")),
            Padding(padding: EdgeInsets.all(15), child: Text("Lorem ipsum dolor Nunc sit ameus.")),
          ],
        ),
      );
  }
}
