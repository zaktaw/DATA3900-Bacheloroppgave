import 'package:flutter/material.dart';

class ActivityBottombar extends StatelessWidget {
  ActivityBottombar(this.incrementZoneIndex, {Key? key}) : super(key: key);

  late final VoidCallback incrementZoneIndex;

  @override
 Widget build(BuildContext context) {
   return Container(
          height: 60,
          color: Colors.black12,
          child: InkWell(
            onTap: incrementZoneIndex,
            child: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Column(
                children: <Widget>[
                  Text('Fullfør sone'),
                  ],
              ),
            ),
          ),
      );
 }
}

