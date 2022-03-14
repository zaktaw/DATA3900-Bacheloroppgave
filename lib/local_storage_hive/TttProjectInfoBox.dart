import 'package:bacheloroppgave/models/TttProjectInfo.dart';
import 'package:hive/hive.dart';

class TttProjectInfoBox {
  static Box<TttProjectInfo> getTttProjectInfo() =>
      Hive.box<TttProjectInfo>('tttProjectInfo');
}