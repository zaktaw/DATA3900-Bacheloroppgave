import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserToken {
  static final _storage = FlutterSecureStorage();

  static const _keyUserToken = 'userToken';

  static Future setUserToken(String userToken) async =>
      await _storage.write(key: _keyUserToken, value: userToken);

  static Future<String?> getUserToken() async =>
      await _storage.read(key: _keyUserToken);

  static Future<bool> containsToken() async =>
      await _storage.containsKey(key: _keyUserToken);

  static Future removeToken() async =>
      await _storage.delete(key: _keyUserToken);
}
