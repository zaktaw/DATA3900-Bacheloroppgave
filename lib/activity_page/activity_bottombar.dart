import 'package:flutter/material.dart';
import '../models/TttEntries.dart';

const String fullfoer_sone = "Fullfør sone";

class ActivityBottombar extends StatelessWidget {
  ActivityBottombar(
      this.function, this.buttonText, this.entries, this.zoneCount,
      {Key? key})
      : super(key: key);

  late final VoidCallback function;
  final String buttonText;
  TttEntries entries;
  int zoneCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.black12,
      child: InkWell(
        onTap: function,
        child: Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Column(
            children: <Widget>[
              Text(fullfoer_sone,
                  style: TextStyle(
                      color: checkStuff() ? Colors.green : Color.fromARGB(255, 114, 114, 182))),
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
  bool checkStuff() {
    if (zoneCount == -1) {
      return false;
    } else if (entries.tttEntries.length == zoneCount) {
      return true;
    }
    return false;
  }
}
