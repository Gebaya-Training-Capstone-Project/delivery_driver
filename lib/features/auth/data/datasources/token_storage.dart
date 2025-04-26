import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  static final TokenStorage _instance = TokenStorage._internal();
  TokenStorage._internal();
  factory TokenStorage() {
    return _instance;
  }
  static const String _tokenKey = 'jwt_token';

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future<void> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }


}