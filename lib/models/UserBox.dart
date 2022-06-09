import 'package:bacheloroppgave/models/User.dart';
import 'package:hive/hive.dart';

class UserBox {
  static Box<User> getUser() =>
      Hive.box<User>('user');
}
