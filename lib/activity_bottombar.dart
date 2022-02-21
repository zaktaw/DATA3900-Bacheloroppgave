import 'package:flutter/material.dart';

class ActivityBottombar extends StatelessWidget {
  ActivityBottombar(this.nextZone, {Key? key}) : super(key: key);

  late final VoidCallback nextZone;

  @override
 Widget build(BuildContext context) {
   return Container(
          height: 60,
          color: Colors.black12,
          child: InkWell(
            onTap: nextZone,
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

