import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:bacheloroppgave/hero_dialog_route.dart';
import 'package:auto_size_text/auto_size_text.dart';

//Koden er basert på kildekode fra https://github.com/funwithflutter/flutter_ui_tips/tree/master/tip_003_popup_card

class ActivityPopButton extends StatelessWidget {
  const ActivityPopButton(this.activity_name, this.activity_info, {Key? key}) : super(key: key);

  final String activity_name;
  final String activity_info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(HeroDialogRoute(builder: (context) {
            return _ActivityPopCard(activity_name, activity_info, key: key);
          }));
        },
        child: Hero(
          tag: _heroActivityPop,
          child: Material(
            color: CARD_ACT_BTN_COLOR,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32), side: const BorderSide(color: CARD_ACT_BTN_BORDER_COLOR, width: 1)),
            child: Padding(padding: const EdgeInsets.all(6), child: AutoSizeText(activity_name,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24, color: TEXT_COLOR_BLACK)),
          )),
        ),
      ),
    );
  }
}

const String _heroActivityPop = 'hero-activity-pop';

class _ActivityPopCard extends StatelessWidget {
  const _ActivityPopCard(this.activity_name, this.activity_info, {Key? key})
      : super(key: key);

  final String activity_name;
  final String activity_info;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: _heroActivityPop,
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
                  children: [AutoSizeText(
                    activity_name,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: TextStyle(fontSize: 20, color: TEXT_COLOR_BLACK)
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 10, left: 20, right: 20),
                    child: const Divider(
                      color: TEXT_COLOR_BLACK,
                      height: 5
                    ),
                  ),
                  AutoSizeText(activity_info,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(fontSize: 15, color: TEXT_COLOR_BLACK),)
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
