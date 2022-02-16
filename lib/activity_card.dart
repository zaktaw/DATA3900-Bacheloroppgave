// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
        Text('GRUDIG',
            style: TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 114, 114, 182))),
        IconButton(onPressed: null, icon: Icon(Icons.remove_circle_outline)),
        TextField(),
        IconButton(onPressed: null, icon: Icon(Icons.add_circle_outline))
        ]
      ),
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
