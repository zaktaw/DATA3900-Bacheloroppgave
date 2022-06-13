import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  String type;
  Function function;

  SettingsItem(this.type, this.function, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case "radio":
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

      case "dropdown":
        List<DropdownMenuItem<String>> items = ["1", "3", "4" ,"5"];
        return Container(
          child: Card(
              child: Row(
            children: <Widget>[
              Expanded(flex: 4, child: Text("Here 3")),
              Expanded(flex: 6, child: DropdownButton(
                value: "Startvalue",
                icon: Icon(Icons.keyboard_arrow_down), 
                items: items,
                onChanged: ()=>{}))
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
