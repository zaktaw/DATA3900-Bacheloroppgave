import 'package:bacheloroppgave/models/telling.dart';

class Tellinger {
  late List tellinger;

  Tellinger() {
    tellinger = [];
  }

  void addTelling(int zoneIndex, String activity) {
    Telling telling = Telling(zoneIndex, activity, 1);
    tellinger.add(telling);
  }

  void showTellinger() {
    tellinger.forEach((element) {
      var telling = element as Telling;
      print(telling.getCount);
    });
  }
}
