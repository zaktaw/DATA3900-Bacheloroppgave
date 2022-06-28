import 'package:hive/hive.dart';

part 'User.g.dart';

@HiveType(typeId: 5)
class User {

  @HiveField(1)
  late String name;

  late String? token;

  User({
    required this.name, 
    this.token
    });

  factory User.fromJson(Map<String, dynamic> json) {

    return User(
      name: json['name'],
      token: json['token']
    );
  }
}
