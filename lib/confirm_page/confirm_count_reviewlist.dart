import 'package:bacheloroppgave/models/TttEntries.dart';
import 'package:bacheloroppgave/models/ZoneObject.dart';
import 'package:flutter/material.dart';

const String error_list = "Feil i listen, prøv igjen senere";

class ConfirmReviewList extends StatelessWidget {
  late TttEntries entries;
  late List<ZoneObject> zoneList;

  ConfirmReviewList(this.entries, this.zoneList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: entries.getNumberOfZones() != 0
            ? ListView.builder(
                itemCount: zoneList.length,
                itemBuilder: (context, index) {
                  return Text(zoneList[index].zone_name +
                      ": " +
                      entries.getNumberOfCountsInZone(index).toString());
                })
            : const Text(error_list));
  }
}
