import 'package:bacheloroppgave/resources/app_string.dart';
import 'package:flutter/material.dart';

/// Page for info about homepage 
/// Contains ref to text and a gif
class FirstPageview extends StatelessWidget {
  const FirstPageview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( 
      child: Column(
      children: [
      Text(FIRST_PAGEVIEW_STRING_TITLE, textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      Text(FIRST_PAGEVIEW_STRING, style: const TextStyle(fontSize: 15)), 
      Container(child: Image.asset("assets/images/homepage.gif"), decoration: BoxDecoration(border: Border.all(color: Colors.black)))
      ],
    ));
  }
}
