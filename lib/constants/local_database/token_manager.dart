import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<String> getToken(String key) async {
    return _preferences.getString(key) ?? '';
  }

  static Future<void> setToken(String key, String token) async {
    await _preferences.setString(key, token);
  }

  static Future<void> removeToken(String key) async {
    await _preferences.remove(key);
  }
}
