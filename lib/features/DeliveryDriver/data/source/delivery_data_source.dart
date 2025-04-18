import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:delivery_driver/features/DeliveryDriver/data/model/delivery.dart';

class DeliveryDataSource {
  static const String _baseUrl = 'https://eshi-tap.vercel.app/app';

  /// Get a list of delivery models
  Future<List<Delivery>> getDelivery() async {
    final url = Uri.parse('$_baseUrl/delivery-requests');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Parse the JSON response
      final Map<String, dynamic> jsonResponse = json.decode(response.body);

      // Extract the 'data' field which contains the list of deliveries
      final List<dynamic> jsonList = jsonResponse['data'];

      // Convert the list into Delivery objects
      return jsonList
          .map((json) => Delivery.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load deliveries: ${response.statusCode}');
    }
  }
}
// TODO Implement this library.