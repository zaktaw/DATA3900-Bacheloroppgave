import 'package:flutter/material.dart';

class ActivityBottombar extends StatelessWidget {
  const ActivityBottombar({Key? key}) : super(key: key);

  @override
 Widget build(BuildContext context) {
   return Scaffold(
      bottomNavigationBar: Container(
          height: 60,
          color: Colors.black12,
          child: InkWell(
            onTap: () => print('sonemann'),
            child: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Column(
                children: <Widget>[
                  Text('Neste sone'),
                ],
              ),
            ),
          ),
      ),
   );
 }
}

