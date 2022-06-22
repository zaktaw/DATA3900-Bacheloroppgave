import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:bacheloroppgave/http_requests.dart';
import 'package:bacheloroppgave/local_storage_hive/UnsentTttEntriesBox.dart';
import 'package:bacheloroppgave/models/UserToken.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../resources/app_theme.dart';

class SettingsItem extends StatefulWidget {

     String type;
  //Function function;
  int numberOfUnsentTttEntries = 0;

    SettingsItem(this.type, /*this.function,*/ {Key? key}) : super(key: key);


  @override
  State<SettingsItem> createState() => _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {
  @override
  Widget build(BuildContext context) {
     ///Switch that changes the component depending on the argument when calling the constructor
    switch (widget.type) {

      ///Returns a red logout button
      case "logoutbutton":
        return ElevatedButton.icon(
            icon: Icon(Icons.logout),
            label: Text("Logg ut"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(167, 255, 43, 43))),
            onPressed: () => logout(context));

      case "getprojectbutton":
        return ElevatedButton.icon(
            icon: Icon(Icons.download),
            label: Text("Hent prosjekt"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(167, 198, 193, 193))),
            onPressed: () => getProject());

      case "sendtttobjectsbutton":
        return ElevatedButton.icon(
            icon: Icon(Icons.upload),
            label: Text("Send usendte tellinger"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(167, 198, 193, 193))),
            onPressed: () => sendUnsentTttObjects());

      case "dropdown":
        //List<DropdownMenuItem<String>> items = ["1", "3", "4" ,"5"];
        return Container(
          child: Card(
              child: Row(
            children: const <Widget>[
              Expanded(flex: 4, child: Text("Here 3")),

              ///Expanded(flex: 6, child: DropdownButton(
              ///value: "Startvalue",
              ///icon: Icon(Icons.keyboard_arrow_down),
              ///items: items,
              ///onChanged: ()=>{}))
            ],
          )),
        );

      //Unused
      case "toggle":
        return Container(
          child: Card(
              child: Row(
            children: const <Widget>[
              Expanded(flex: 3, child: Text("Here 3")),
              Expanded(flex: 3, child: Text("Here 2")),
              Expanded(flex: 4, child: Text("Here 1"))
            ],
          )),
        );
    }

    return Text("Det er ingen instillingtype med navn: " + type);
  }
  }
}
