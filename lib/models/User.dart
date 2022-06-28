import 'package:hive/hive.dart';

part 'User.g.dart';

@HiveType(typeId: 5)
class User {

  @HiveField(1)
  late String username;

  late String? token;

  User({
    required this.username, 
    this.token
    });

  factory User.fromJson(Map<String, dynamic> json,  username) {

    return User(
      username: username,
      token: json['token']
    );
  }
}
