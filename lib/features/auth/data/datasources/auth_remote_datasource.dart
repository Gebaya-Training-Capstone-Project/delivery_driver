import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthRemoteDataSource {
  final http.Client client;
  final String baseUrl = 'https://eshi-tap.vercel.app/api';

  AuthRemoteDataSource(this.client);
  Future<String> login({
    required String username,
    required String password,

  }) async {
    print('Login request: username = $username, password = $password');
    final response = await client.post(
      Uri.parse('$baseUrl/user/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
             }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data['data']?['token'];
      if (token != null && token is String) {
        return token;
      } else {
        print('Response: ${response.body}');
        throw Exception('Login succeeded but no token returned');

      }
    } else if (response.statusCode == 400 || response.statusCode == 401) {
      throw Exception(jsonDecode(response.body)['error']);
    } else {
      print('Login request: email = $username, password = $password');
      throw Exception('Failed to login');
    }
  }
}