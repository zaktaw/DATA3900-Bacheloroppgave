import 'package:flutter/material.dart';

class HelpApp extends StatelessWidget {
  const HelpApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Align(
          alignment: Alignment.topCenter, child: Text("Informasjon om appen")),
      const Align(alignment: Alignment.center, child: Text("Appen er bra"))
    ]);
  }
}
