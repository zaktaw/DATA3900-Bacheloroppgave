import 'package:bacheloroppgave/models/TttEntry.dart';

class TttObject {
  late Map counts;
  late String name;
  late List<String> activities;

  TttObject(this.counts, this.name, this.activities) {

    counts.forEach((key, value) {
      List countsList = value as List;

      activities.forEach((activity) {
        bool activityInCounts = false;

        countsList.forEach((count) {
          TttEntry telling = count as TttEntry;
          if (telling.activity == activity) activityInCounts = true;
        });

        if (!activityInCounts) {
          TttEntry newCount = new TttEntry(activity, 0);
          countsList.add(newCount);
        }
      });
    });
  }

  void showTellinger() {
    counts.forEach((key, value) {
      if (value is List) {
        List test = value;
        print(key);
        test.forEach((element) {
          TttEntry test1 = element;
          print(
              "Act:" + test1.activity + "   Count: " + test1.count.toString());
        });
      }
    });
  }
}
