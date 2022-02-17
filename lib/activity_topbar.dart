import 'package:flutter/material.dart';
import 'activities_info_pop.dart';

const String _heroActivitiesPop = 'hero-activities-pop';

class ActivityTopbar extends StatelessWidget with PreferredSizeWidget {
  final Size preferredSize;
  final String zone;

  ActivityTopbar(
    this.zone,{
    Key? key,
  })  : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => print("test")),
      backgroundColor: Color.fromARGB(255, 189, 190, 187),
      centerTitle: true,
      title: InkWell(
        onTap: () => print("SONEINFO"),
        child: Text(zone),
      ),
      actions: <Widget>[
        ActivitiesPopButton('Dummy text :)', 'dummy top', key: key)
      ],
    );
  }
}
