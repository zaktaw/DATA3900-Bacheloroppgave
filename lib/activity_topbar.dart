import 'package:flutter/material.dart';
import 'activities_info_pop.dart';
import 'zone_info_in_activities.dart';

const String _heroActivitiesPop = 'hero-activities-pop';

class ActivityTopbar extends StatelessWidget with PreferredSizeWidget {
  final Size preferredSize;
  final String zone;
  late final VoidCallback previousZone;

  ActivityTopbar(
    this.zone,
    this.previousZone,
    {
    Key? key,
  })  : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => previousZone()),
      backgroundColor: Color.fromARGB(255, 189, 190, 187),
      centerTitle: true,
      title: ZoneInActivitiesPopButton("dummy text", zone, key:key),
      actions: <Widget>[
        ActivitiesPopButton('Dummy text :)', 'dummy top', key: key)
      ],
    );
  }
}
