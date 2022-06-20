import 'package:bacheloroppgave/models/UserToken.dart';
import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  String type;
  //Function function;

  void logout(BuildContext context) {
    UserToken.removeToken().whenComplete(() => Navigator.of(context).pushNamed('/login'));    
  }

  SettingsItem(this.type, /*this.function,*/ {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case "logoutbutton":
        return ElevatedButton.icon(
                icon: Icon(Icons.logout),
                label: Text("Logg ut"),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(167, 255, 43, 43))),
                onPressed: () => logout(context)
                );

      case "dropdown":
        //List<DropdownMenuItem<String>> items = ["1", "3", "4" ,"5"];
        return Container(
          child: Card(
              child: Row(
            children: <Widget>[
              Expanded(flex: 4, child: Text("Here 3")),
              /*Expanded(flex: 6, child: DropdownButton(
                value: "Startvalue",
                icon: Icon(Icons.keyboard_arrow_down), 
                items: items,
                onChanged: ()=>{}))*/
            ],
          )),
        );

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
