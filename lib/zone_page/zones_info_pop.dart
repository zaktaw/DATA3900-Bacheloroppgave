import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:bacheloroppgave/hero_dialog_route.dart';

//Koden er basert på kildekode fra https://github.com/funwithflutter/flutter_ui_tips/tree/master/tip_003_popup_card

const String info_zones = 'Informasjon om soner';

class ZonesInfoPop extends StatelessWidget {
  const ZonesInfoPop(this.zones_info, {Key? key}) : super(key: key);

  final String zones_info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(HeroDialogRoute(builder: (context) {
            return _ZonesInfoPop(zones_info, key: key);
          }));
        },
        child: const Hero(
          tag: _heroZonesPop,
          child: Material(
              color: BUTTON_COLOR,
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0))),
              child: Icon(Icons.info_outline_rounded)),
        ),
      ),
    );
  }
}

const String _heroZonesPop = 'hero-zones-pop';

class _ZonesInfoPop extends StatelessWidget {
  _ZonesInfoPop(this.zones_info, {Key? key}) : super(key: key);

  final String zones_info;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: _heroZonesPop,
          child: Material(
            color: BACKGROUND_TEXT_COLOR,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(info_zones,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: TEXT_COLOR_BLACK)),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 5, bottom: 10, left: 20, right: 20),
                      child: const Divider(color: TEXT_COLOR_BLACK, height: 5),
                    ),
                    Text(
                      zones_info,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 15, color: TEXT_COLOR_BLACK),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
