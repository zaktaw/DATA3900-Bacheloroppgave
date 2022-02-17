import 'package:flutter/material.dart';
import 'package:bacheloroppgave/hero_dialog_route.dart';

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
            color: Color.fromARGB(255, 82, 82, 82),
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: Text(activity_name,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, color: Colors.white)),
          ),
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
            color: Color.fromARGB(255, 82, 82, 82),
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [Text(
                    activity_name,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.white)
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 10, left: 20, right: 20),
                    child: const Divider(
                      color: Colors.white,
                      height: 5
                    ),
                  ),
                  Text(activity_info,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.white),)
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
