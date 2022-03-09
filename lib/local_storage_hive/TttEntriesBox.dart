import 'package:hive/hive.dart';
import 'package:bacheloroppgave/models/TttEntries.dart';

class TttEntriesBox {
  static Box<TttEntries> getTransactions() =>
      Hive.box<TttEntries>('tttEntries');
}