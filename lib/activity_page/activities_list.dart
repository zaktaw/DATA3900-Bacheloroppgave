import 'package:flutter/material.dart';
import 'activity_card.dart';
import '../models/telling.dart';
import '../models/tellinger.dart';

class ActivitiesList extends StatelessWidget {
  final void Function(int, String, int) count;
  final int zoneIndex;
  Tellinger tellinger;

  ActivitiesList(this.count, this.zoneIndex, this.tellinger, {Key? key}) : super(key: key);

  final List<String> aktiviteter = <String>[
    'GRUDIG',
    'ALPERS',
    'ALLAP',
    'DIV',
    'ALLUDIG'
  ];

  final List<String> aktivitetsInfo = <String>[
    'Personer i gruppe uten digitale hjelpemidler',
    'Person alene i kontakt med personal',
    'Person alene med laptop',
    'Diverse aktiviteter',
    'Person alene uten digitale hjelpemidler'
  ];

  String setTellinger(String activity) {
    var retrievedTellinger = tellinger.getTellinger(zoneIndex);

    for (var element in retrievedTellinger) {
      Telling telling = element as Telling;
      if (telling.activity == activity) {
        return telling.count.toString();
      }
    }

    return '0';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: aktiviteter.length,
        itemBuilder: (context, index) {
          return ActivityCard(aktiviteter[index], aktivitetsInfo[index], count, zoneIndex, setTellinger(aktiviteter[index]));
        },
      ),
    );
  }

  /* @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    color: Colors.amber[colorCodes[index]],
                    child: Center(child: Text('Entry ${entries[index]}')),
                  );
                }),
          )
        ],
      ),
    );
  } */
}
