import 'package:hive/hive.dart';

/// Model for Hive ttt entries box
/// used for storing ttt entries in local storage on phone
class SettingsBox {
  static Box<bool> getSettingsBox() =>
      Hive.box<bool>('settingsBox');
}