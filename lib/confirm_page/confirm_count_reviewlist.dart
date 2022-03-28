import 'package:auto_size_text/auto_size_text.dart';
import 'package:bacheloroppgave/models/TttEntries.dart';
import 'package:bacheloroppgave/models/ZoneObject.dart';
import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:flutter/material.dart';

const String error_list = "Feil i listen, prøv igjen senere";

class ConfirmReviewList extends StatelessWidget {
  late TttEntries entries;
  late List<ZoneObject> zoneList;

  ConfirmReviewList(this.entries, this.zoneList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              boxShadow: SHADOW_CONFIRM_REVIEWLIST,
              borderRadius: BorderRadius.circular(BOX_BORDER_RADIUS),
              color: BACKGROUND_TEXT_COLOR,
            ),
            margin: EdgeInsets.only(
                left: CONFIRM_PAGE_MARGIN_WIDTH_FACTOR *
                    MediaQuery.of(context).size.width,
                right: CONFIRM_PAGE_MARGIN_WIDTH_FACTOR *
                    MediaQuery.of(context).size.width
                    , bottom: MediaQuery.of(context).size.height * CONFIRM_PAGE_DROPDOWN_MARGIN_FACTOR)
                  ,
            child: entries.getNumberOfZones() != 0
                ? ListView.builder(
                    itemCount: zoneList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        child: Row(children: [
                          Flexible(
                            child: AutoSizeText(
                              zoneList[index].zone_name + ": ",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold, fontSize: CONFIRM_PAGE_REWIEWLIST_FONTSIZE),
                                  maxLines: 1,
                            ),
                          ),
                          Flexible(
                            child: AutoSizeText(entries
                                .getNumberOfCountsInZone(index)
                                .toString() + " observasjoner", 
                                style: const TextStyle(fontSize: CONFIRM_PAGE_REWIEWLIST_FONTSIZE),
                                maxLines: 1,),
                          )
                        ]),
                        padding: EdgeInsets.only(top: 10),
                      );
                    })
                : const Text(error_list)));
  }
}
