import 'package:flutter/material.dart';
import 'package:bacheloroppgave/hero_dialog_route.dart';

//Koden er basert på kildekode fra https://github.com/funwithflutter/flutter_ui_tips/tree/master/tip_003_popup_card

class ActivitiesPopButton extends StatelessWidget {
  const ActivitiesPopButton(this.activities_info, this.activities, {Key? key}) : super(key: key);

  final String activities;
  final String activities_info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(HeroDialogRoute(builder: (context) {
            return _ActivitiesPopCard(activities, activities_info, key: key);
          }));
        },
        child: const Hero(
          tag: _heroActivitiesPop,
          child: Material(
              color: Color.fromARGB(255, 110, 107, 107),
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0))),
              child: Icon(Icons.info_outline_rounded)),
        ),
      ),
    );
  }
}

const String _heroActivitiesPop = 'hero-activities-pop';

class _ActivitiesPopCard extends StatelessWidget {
  const _ActivitiesPopCard(this.activities, this.activities_info, {Key? key})
      : super(key: key);

  final String activities;
  final String activities_info;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: _heroActivitiesPop,
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
                  children: [
                    Text(activities,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 5, bottom: 10, left: 20, right: 20),
                      child: const Divider(color: Colors.white, height: 5),
                    ),
                    Text(
                      activities_info,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Colors.white),
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