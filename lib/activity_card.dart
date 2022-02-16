// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ActivityCard extends StatelessWidget {
  ActivityCard(this.activity_name, {Key? key}) : super(key: key);

  String activity_name;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(children: <Widget>[
        Expanded(
          flex: 5,
          child: Text(activity_name,
              style: TextStyle(
                  fontSize: 20, color: Color.fromARGB(255, 114, 114, 182))),
        ),
        Expanded(
          flex: 2,
          child: IconButton(
              onPressed: null, icon: Icon(Icons.remove_circle_outline)),
        ),
        Expanded(
          flex: 1,
          child: TextField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ]),
        ),
        Expanded(
          flex: 2,
          child:
              IconButton(onPressed: null, icon: Icon(Icons.add_circle_outline)),
        )

        /*Text('GRUDIG',
            style: TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 114, 114, 182))),
        IconButton(onPressed: null, icon: Icon(Icons.remove_circle_outline)),
        TextField(),
        IconButton(onPressed: null, icon: Icon(Icons.add_circle_outline))*/
      ]),
    );
  }
}

class ActivityText extends StatelessWidget {
  const ActivityText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
