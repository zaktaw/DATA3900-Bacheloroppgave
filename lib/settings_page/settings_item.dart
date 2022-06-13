import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Row(
          children: const <Widget>[
            Expanded(
              flex: 3,
              child: Text("Here 3")),
            Expanded(
              flex: 3,
              child: Text("Here 2")),
            Expanded(
              flex: 4,
              child: Text("Here 1"))
          ],
        )
      ),
    );
  }
}