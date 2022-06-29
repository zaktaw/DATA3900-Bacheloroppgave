import 'package:bacheloroppgave/resources/app_string.dart';
import 'package:flutter/material.dart';

class FourthPageview extends StatelessWidget {
  const FourthPageview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: 
    Column(
        children: [
          Text(FOURTH_PAGEVIEW_STRING_TITLE, textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(FOURTH_PAGEVIEW_STRING, style: const TextStyle(fontSize: 15)), 
          Container(child: Image.asset("assets/images/confirm_count.gif"), decoration: BoxDecoration(border: Border.all(color: Colors.black)))
      ],
      )
    );
  }
}
