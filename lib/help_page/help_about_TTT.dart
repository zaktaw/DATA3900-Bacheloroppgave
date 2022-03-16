import 'package:flutter/material.dart';

class HelpTTT extends StatelessWidget {
  const HelpTTT({ Key? key }) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Align(
          alignment: Alignment.topCenter, child: Text("Informasjon om TTT")),
      const Align(alignment: Alignment.center, child: Text("TTT er bra"))
    ]);
  }
}