import 'dart:ffi';

import 'package:bacheloroppgave/activity_card.dart';
import 'package:bacheloroppgave/models/telling.dart';
import 'package:bacheloroppgave/models/tellinger.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tellinger = Tellinger();
  final List<String> activityCodes = <String>[
    'GRUDIG',
    'ALPERS',
  ];
  group('Count', () {
    int zoneIndex = 1;
    int countValue = 1;

    Map countMap = {};

    test('Count should be empty', () {
      expect(tellinger.getTellinger(zoneIndex).toString(), [].toString());
    });

    test('Count should match (1 count)', () {
      //Stage mock object
      Telling testCount = Telling(activityCodes[0], countValue);
      List countList = [];
      countList.add(testCount);
      countMap[zoneIndex] = countList;

      //Function call
      tellinger.count(zoneIndex, activityCodes[0], countValue);

      expect(tellinger.getTellinger(zoneIndex).toString(),
          countMap[zoneIndex].toString());
    });

    test('Count should match (New count and activity, same zone)', () {
      //Stage mock object
      Telling testCount1 = Telling(activityCodes[1], countValue);
      List counts = countMap[zoneIndex];
      counts.add(testCount1);

      //Function call
      tellinger.count(zoneIndex, activityCodes[1], countValue);

      expect(tellinger.getTellinger(zoneIndex).toString(),
          countMap[zoneIndex].toString());
    });

    test('Count should match (1 count, new zone)', () {
      //Change zone
      zoneIndex++;

      //Stage mock object
      Telling testCount = Telling(activityCodes[0], countValue);
      List countList = [];
      countList.add(testCount);
      countMap[zoneIndex] = countList;

      //Function call
      tellinger.count(zoneIndex, activityCodes[0], countValue);

      expect(tellinger.getTellinger(zoneIndex).toString(),
          countMap[zoneIndex].toString());
    });

    test('Count should match (new value for count in list)', () {
      //New value for number counted
      countValue = 2;

      //Set new value for mock object
      Telling testCount = countMap[zoneIndex][0];
      testCount.count = countValue;

      //Function call with new value
      tellinger.count(zoneIndex, activityCodes[0], countValue);

      expect(tellinger.getTellinger(zoneIndex).toString(),
          countMap[zoneIndex].toString());
    });
  });
}
