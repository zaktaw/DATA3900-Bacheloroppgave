import 'package:hive/hive.dart';

part 'User.g.dart';

@HiveType(typeId: 5)
class User {

  @HiveField(0)
  late int id;

  @HiveField(1)
  late String name;

  late String? token;

  User(this.id, this.name, [this.token]);
}
