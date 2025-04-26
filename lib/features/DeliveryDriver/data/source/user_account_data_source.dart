import 'dart:convert';
import 'package:delivery_driver/features/Auth/data/datasources/token_storage.dart';
//import 'package:delivery_driver/features/DeliveryDriver/domain/entity/user_account_entity.dart';
import 'package:delivery_driver/features/DeliveryDriver/data/model/user_account_model.dart';
import 'package:http/http.dart' as http;

//import 'package:delivery_driver/features/DeliveryDriver/data/model/user_account_model.dart';

class UserAccountDataSource {
  static const String _baseUrl = 'https://eshi-tap.vercel.app/api';

  UserAccountDataSource();
  /// Fetch the currently logged-in user's account
  Future<UserAccount> fetchUserAccount() async {
    final url = Uri.parse('$_baseUrl/user/loggedInUser');
    final token = await TokenStorage().getToken();
    if (token == null) {
      throw Exception('Authentication token not found.');
    }
    final response = await http.get(
      url,
      headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
        // If authorization is required, add it here
        // 'Authorization': 'Bearer YOUR_TOKEN',
      },
    );
    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);

      // If your data is inside a `data` key, extract it
      final Map<String, dynamic> userData = jsonResponse['data'];

      return UserAccount.fromJson(userData);
    } else {
      throw Exception('Failed to load user profile: ${response.statusCode}');
    }
  }
}
