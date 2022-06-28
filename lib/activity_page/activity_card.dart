// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:bacheloroppgave/local_storage_hive/SettingsBox.dart';
import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:bacheloroppgave/resources/keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'activity_pop_button.dart';

const String _heroActivityPop = "activity-pop-hero";

/// Card with activityname, counter and info-pop-up widget
class ActivityCard extends StatelessWidget {
  ActivityCard(this.activity_name, this.activity_info, this.addTttEntry,
      this.zoneIndex, this.valueFromPreviousCount,
      {Key? key})
      : super(key: key) {
    txt.text = valueFromPreviousCount;
  }

  late String valueFromPreviousCount;
  final void Function(int, String, int) addTttEntry;
  int zoneIndex;
  String activity_name;
  String activity_info;
  var txt = TextEditingController(text: "");

  bool checkActivitySetting() {
    return SettingsBox.getSettingsBox().get(activityInfoSettingKey) as bool;
  }

  /// Increment value (observations) by 1
  String increment(String value) {
    int intValue = int.parse(value);
    addTttEntry(zoneIndex, activity_name, (intValue + 1));
    return (intValue + 1).toString();
  }

  /// Decrement value (observations) by 1
  String decrement(String value) {
    int intValue = int.parse(value);
    if ((intValue - 1) >= 0) {
      addTttEntry(zoneIndex, activity_name, (intValue - 1));
      return (intValue - 1).toString();
    }
    return intValue.toString();
  }

  /// Set value (observations) manually (keyboard-input)
  String manualInput(String? value) {
    String stringValue = value.toString();
    int intValue = int.parse(stringValue);
    addTttEntry(zoneIndex, activity_name, intValue);
    return stringValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: Card(
          color: CARD_BACKGROUND_COLOR,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            child: Column(children: [
              Row(children: <Widget>[
                Expanded(
                    flex: 5,
                    child: ActivityPopButton(activity_name, activity_info,
                        key: key)),
                Expanded(
                  flex: 2,
                  child: IconButton(
                      iconSize: MediaQuery.of(context).size.width *
                          ACTIVITY_INC_DEC_BUTTONS_FACTOR,
                      color: BUTTON_COLOR,
                      onPressed: () {
                        txt.text = decrement(txt.text);
                      },
                      icon: Icon(Icons.remove_circle_outline)),
                ),
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 2)),
                    controller: txt,
                    onChanged: (Text) => {
                      if (txt.text.isNotEmpty) {manualInput(txt.text)}
                    },
                    textAlign: TextAlign.center,
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
                      iconSize: MediaQuery.of(context).size.width *
                          ACTIVITY_INC_DEC_BUTTONS_FACTOR,
                      color: BUTTON_COLOR,
                      onPressed: () {
                        txt.text = increment(txt.text);
                      },
                      icon: Icon(Icons.add_circle_outline)),
                )
              ]),
              checkActivitySetting()
                  ? Row(
                      children: <Widget>[
                        Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                          child: Text(
                            activity_info,
                            style: TextStyle(fontSize: 18),
                          ),
                        ))
                      ],
                    )
                  : const SizedBox.shrink()
            ]),
          ),
        ),
        decoration: SHADOW_ACT_CARD);
  }
}
