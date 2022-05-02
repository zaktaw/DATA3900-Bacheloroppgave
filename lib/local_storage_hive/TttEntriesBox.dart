import 'package:hive/hive.dart';
import 'package:bacheloroppgave/models/TttEntries.dart';

// Model for Hive ttt entries box
// used for storing ttt entries in local storage on phone
class TttEntriesBox {
  static Box<TttEntries> getTttEntries() =>
      Hive.box<TttEntries>('tttEntries');
}