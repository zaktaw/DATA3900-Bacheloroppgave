import 'package:bacheloroppgave/resources/app_string.dart';
import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:flutter/material.dart';

class FirstPageview extends StatelessWidget {
  const FirstPageview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( 
      child: Column(
      children: [
      Text(FIRST_PAGEVIEW_STRING_TITLE, textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      Text(FIRST_PAGEVIEW_STRING, style: const TextStyle(fontSize: 15)), 
      Container(child: Image.asset("assets/images/mainmenu_example.gif"), decoration: BoxDecoration(border: Border.all(color: Colors.black)), height: MediaQuery.of(context).size.height * GIF_PAGEVIEW_MARGIN_FACTOR_HEIGHT, width: MediaQuery.of(context).size.height * GIF_PAGEVIEW_MARGIN_FACTOR_WIDTH),
      ],
    ));
  }
}