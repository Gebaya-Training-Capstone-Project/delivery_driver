import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:delivery_driver/features/DeliveryDriver/data/model/delivery_request.dart';

class DeliveryRequestDataSource {
  static const String _baseUrl = 'https://eshi-tap.vercel.app/app';

  /// Get a list of delivery request models
  Future<List<DeliveryRequest>> getDeliveryRequests() async {
    final url = Uri.parse('$_baseUrl/delivery-requests');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Parse the JSON response
      final Map<String, dynamic> jsonResponse = json.decode(response.body);

      // Extract the 'data' field which contains the list of delivery requests
      final List<dynamic> jsonList = jsonResponse['data'];

      // Convert the list into DeliveryRequest objects
      return jsonList
          .map((json) => DeliveryRequest.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load delivery requests: ${response.statusCode}');
    }
  }
}
