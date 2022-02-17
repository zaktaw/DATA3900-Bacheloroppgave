import 'package:flutter/material.dart';
import './activity_card.dart';

class ActivitiesList extends StatelessWidget {

  final void Function(String) incrementTelling;

  ActivitiesList(this.incrementTelling, {Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: aktiviteter.length,
        itemBuilder: (context, index) {
          return ActivityCard(aktiviteter[index], aktivitetsInfo[index]);
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
