import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:flutter/material.dart';
import '../models/TttEntries.dart';

const String FINISH_ZONE = "Fullfør sone";

class ActivityBottombar extends StatelessWidget {
  ActivityBottombar(
      this.function, this.buttonText, this.entries, this.zoneCount, this.color,
      {Key? key})
      : super(key: key);

  late final VoidCallback function;
  final String buttonText;
  TttEntries entries;
  int zoneCount;

  late Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: SECONDARY_COLOR,
      child: InkWell(
        onTap: function,
        child: Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Column(
            children: <Widget>[
              Text(FINISH_ZONE,
                  style: TextStyle(fontSize: ACTIVITY_BOTTOMBAR_FONTSIZE,
                      color: checkIfAllZonesAreCounted() ? TEXT_COLOR_BLACK : color)),
            ],
          ),
        ),
      ),
    );
  }

  /*zoneCount == -1 means that the activitybar is used in an activity-page,
  and we want to return false every time.
  if all zones are counted return true, else return false
  if this method returns true, the bottombar in zones will change to green text*/
  bool checkIfAllZonesAreCounted() {
    if (entries.tttEntries.length == zoneCount) {
      return true;
    }
    return false;
  }
}
