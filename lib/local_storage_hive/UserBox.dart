import 'package:bacheloroppgave/models/User.dart';
import 'package:hive/hive.dart';

/// Model for Hive user box
/// User is sent from server and used to set name of observer for count
class UserBox {
  static Box<User> getUser() =>
      Hive.box<User>('user');
}
