import 'package:bacheloroppgave/models/TttEntries.dart';
import 'package:bacheloroppgave/models/TttProjectInfo.dart';
import 'package:hive/hive.dart';

/// Model for Hive ttt project info box
/// used for storing project info in local storage on phone
class TttProjectInfoBox {
  static Box<TttProjectInfo> getTttProjectInfo() =>
      Hive.box<TttProjectInfo>('tttProjectInfo');
}
