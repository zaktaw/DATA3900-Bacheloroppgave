import 'package:hive/hive.dart';
import 'package:bacheloroppgave/models/TttEntries.dart';

class TttEntriesBox {
  static Box<TttEntries> getTttEntries() =>
      Hive.box<TttEntries>('tttEntries');
}