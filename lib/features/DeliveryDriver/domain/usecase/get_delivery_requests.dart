import 'package:delivery_driver/features/DeliveryDriver/domain/entity/delivery_request_entity.dart';
import 'package:delivery_driver/features/DeliveryDriver/domain/repository/delivery_request_repository.dart';

class GetDeliveryRequestsUseCase {
  final DeliveryRequestRepository repository;

  // Constructor injecting the repository
  GetDeliveryRequestsUseCase(this.repository);

  // Execute method to fetch delivery requests
  Future<List<DeliveryRequestEntity>> execute() async {
    try {
      // Fetching the list of delivery requests from the repository
      return await repository.getDeliveryRequests();
    } catch (e) {
      // Handle any errors, e.g., network failure, no data, etc.
      throw Exception('Error fetching delivery requests: $e');
    }
  }
}
