import 'package:flutter/material.dart';

class ActivitiesList extends StatelessWidget {
  ActivitiesList({Key? key}) : super(key: key);

  final List<String> aktiviteter = <String>['GRUDIG', 'ALPERS', 'ALLAP', 'DIV', 'ALLUDIG'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: aktiviteter.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {},
              title: Text(aktiviteter[index]),
            ),
          );
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
