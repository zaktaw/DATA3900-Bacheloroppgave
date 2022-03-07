import 'dart:ffi';

import 'package:bacheloroppgave/activity_page/activity_card.dart';
import 'package:bacheloroppgave/models/TttEntry.dart';
import 'package:bacheloroppgave/models/TttEntries.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tellinger = TttEntries();
  final List<String> activityCodes = <String>[
    'GRUDIG',
    'ALPERS',
  ];
  group('Count', () {
    int zoneIndex = 1;
    int countValue = 1;

    Map countMap = {};

    test('Count should be empty', () {
      expect(tellinger.getTttEntries(zoneIndex).toString(), [].toString());
    });

    test('Count should match (1 count)', () {
      //Stage mock object
      TttEntry testCount = TttEntry(activityCodes[0], countValue);
      List countList = [];
      countList.add(testCount);
      countMap[zoneIndex] = countList;

      //Function call
      tellinger.addTttEntry(zoneIndex, activityCodes[0], countValue);

      expect(tellinger.getTttEntries(zoneIndex).toString(),
          countMap[zoneIndex].toString());
    });

    test('Count should match (New count and activity, same zone)', () {
      //Stage mock object
      TttEntry testCount1 = TttEntry(activityCodes[1], countValue);
      List counts = countMap[zoneIndex];
      counts.add(testCount1);

      //Function call
      tellinger.addTttEntry(zoneIndex, activityCodes[1], countValue);

      expect(tellinger.getTttEntries(zoneIndex).toString(),
          countMap[zoneIndex].toString());
    });

    test('Count should match (1 count, new zone)', () {
      //Change zone
      zoneIndex++;

      //Stage mock object
      TttEntry testCount = TttEntry(activityCodes[0], countValue);
      List countList = [];
      countList.add(testCount);
      countMap[zoneIndex] = countList;

      //Function call
      tellinger.addTttEntry(zoneIndex, activityCodes[0], countValue);

      expect(tellinger.getTttEntries(zoneIndex).toString(),
          countMap[zoneIndex].toString());
    });

    test('Count should match (new value for count in list)', () {
      //New value for number counted
      countValue = 2;

      //Set new value for mock object
      TttEntry testCount = countMap[zoneIndex][0];
      testCount.count = countValue;

      //Function call with new value
      tellinger.addTttEntry(zoneIndex, activityCodes[0], countValue);

      expect(tellinger.getTttEntries(zoneIndex).toString(),
          countMap[zoneIndex].toString());
    });
  });
}
