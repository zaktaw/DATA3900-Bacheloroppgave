// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'activity_pop_button.dart';

const String _heroActivityPop = "activity-pop-hero";

class ActivityCard extends StatelessWidget {
  ActivityCard(
      this.activity_name, this.activity_info, this.addTttEntry, this.zoneIndex, this.tellingActivity,
      {Key? key})
      : super(key: key) {
      txt.text = tellingActivity;
  }

  late String tellingActivity;
  final void Function(int, String, int) addTttEntry;

  int zoneIndex;
  String activity_name;
  String activity_info;
  var txt = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Card(color: CARD_BACKGROUND_COLOR,
      shape: RoundedRectangleBorder(side: BorderSide(color: CARD_BORDER_COLOR, width: 1), borderRadius: BorderRadius.circular(10)),
      child: Row(children: <Widget>[
        Expanded(
            flex: 5,
            child: ActivityPopButton(activity_name, activity_info, key: key)),
        Expanded(
          flex: 2,
          child: IconButton(
            iconSize: MediaQuery.of(context).size.width * ACTIVITY_INC_DEC_BUTTONS_FACTOR,
            color: BUTTON_COLOR,
              onPressed: () {
                txt.text = decrement(txt.text);
              },
              icon: Icon(Icons.remove_circle_outline)),
        ),
        Expanded(
          flex: 1,
          child: TextFormField(
            decoration: InputDecoration(fillColor: Colors.white, filled: true),
            controller: txt,
            onChanged: (Text) => {
              if (txt.text.isNotEmpty) {manualInput(txt.text)}
            },
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.bottom,
            style: TextStyle(fontSize: ACTIVITY_MANUAL_INPUT_FONTSIZE),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: IconButton(
            iconSize: MediaQuery.of(context).size.width * ACTIVITY_INC_DEC_BUTTONS_FACTOR,
            color: BUTTON_COLOR,
              onPressed: () {
                txt.text = increment(txt.text);
              },
              icon: Icon(Icons.add_circle_outline)),
        )

        /*Text('GRUDIG',
            style: TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 114, 114, 182))),
        IconButton(onPressed: null, icon: Icon(Icons.remove_circle_outline)),
        TextField(),
        IconButton(onPressed: null, icon: Icon(Icons.add_circle_outline))*/
      ]),
    );
  }

  String increment(String value) {
    int intValue = int.parse(value);
    addTttEntry(zoneIndex, activity_name, (intValue + 1));
    return (intValue + 1).toString();
  }

  String decrement(String value) {
    int intValue = int.parse(value);
    if ((intValue - 1) >= 0) {
      addTttEntry(zoneIndex, activity_name, (intValue - 1));
      return (intValue - 1).toString();
    }
    return intValue.toString();
  }

  String manualInput(String? value) { 
    String stringValue = value.toString();
    int intValue = int.parse(stringValue);
    addTttEntry(zoneIndex, activity_name, intValue);
    return stringValue;
  }
}
