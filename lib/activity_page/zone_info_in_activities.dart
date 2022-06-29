import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:bacheloroppgave/hero_dialog_route.dart';

/// Contains pop-up for displaying information about current zone when title in activity is pressed
/// Code based on sourcecode from: https://github.com/funwithflutter/flutter_ui_tips/tree/master/tip_003_popup_card
class ZoneInActivitiesPopButton extends StatelessWidget {
  const ZoneInActivitiesPopButton(this.zone_info, this.zone, this.colorAnimation, {Key? key})
      : super(key: key);

  final String zone;
  final String zone_info;
  final Animation<dynamic> colorAnimation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(HeroDialogRoute(builder: (context) {
            return _ZoneInfoPopCard(zone, zone_info, key: key);
          }));
        },
        child: Hero(
          tag: _heroZoneInActivitiesPop,
          child: Material(
              color: colorAnimation.value,
              elevation: 3,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0))),
              child: Padding(padding: const EdgeInsets.fromLTRB(17,5,17,5), 
              child: AutoSizeText(zone, maxLines: 1, style: const TextStyle(fontSize: ACTIVITY_TOP_TITLE_FONTSIZE)),)),
        ),
      ),
    );
  }
}

const String _heroZoneInActivitiesPop = 'hero-zone-in-activities-pop';

class _ZoneInfoPopCard extends StatelessWidget {
  const _ZoneInfoPopCard(this.zone, this.zone_info, {Key? key})
      : super(key: key);

  final String zone;
  final String zone_info;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: _heroZoneInActivitiesPop,
          child: Material(
            color: BACKGROUND_TEXT_COLOR,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AutoSizeText(zone,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(fontSize: 20, color: TEXT_COLOR_BLACK)),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 5, bottom: 10, left: 20, right: 20),
                      child: const Divider(color: TEXT_COLOR_BLACK, height: 5),
                    ),
                    AutoSizeText(
                      zone_info,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 15, color: TEXT_COLOR_BLACK),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
