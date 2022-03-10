import 'package:hive/hive.dart';

part 'TttEntry.g.dart';

@HiveType(typeId: 0)
class TttEntry {

  @HiveField(0)
  late String activity;

  @HiveField(1)
  late int count;

  TttEntry(this.activity, this.count);

  int get getCount {
    return count;
  }

   String toString() {
    return activity + ", " + count.toString();
  }

 
}