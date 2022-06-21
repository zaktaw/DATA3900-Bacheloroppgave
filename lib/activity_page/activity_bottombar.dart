import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:flutter/material.dart';
import '../models/TttEntries.dart';

/// Bottombar for the activitypage with logic to change appearance of confirmbutton if all zones are counted 
class ActivityBottombar extends StatelessWidget {
  
  ActivityBottombar(
      this.function, this.buttonText, this.entries, this.zoneCount, this.color,
      [this.colorAnimation]);

  late final VoidCallback function;
  final String buttonText;
  TttEntries entries;
  int zoneCount;
  final Animation<dynamic>? colorAnimation;
  late Color color;


  /// Check if all zones are counted, compare no. of zones counted to number of zones in project
  /// if return true, the bottombar is enabled and user can route to confirmpage 
  /// if return false, bottom bar is "disabled" and shows error message to user when pressed
  bool checkIfAllZonesAreCounted() {
    if (entries.tttEntries.length == zoneCount) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: BOTTOMBAR_COLOR,
      child: InkWell(
        onTap: function,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
                child: Text(buttonText,
                    style: TextStyle(
                        fontSize: ACTIVITY_BOTTOMBAR_FONTSIZE,
                        fontWeight: FontWeight.w500,
                        color: checkIfAllZonesAreCounted()
                            ? TEXT_COLOR_BLACK
                            : color)),
                decoration: SHADOW_ACTIVITY_BOTTOMBAR(colorAnimation?.value),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
