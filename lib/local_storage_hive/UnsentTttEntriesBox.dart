import 'package:hive/hive.dart';
import '../models/TttObject.dart';

/// Model for Hive ttt entries box
/// used for storing unsent ttt entries in local storage on phone
class UnsentTttEntriesBox {
  static Box<TttObject> getTttEntries() =>
      Hive.box<TttObject>('unsentTttEntries');
}