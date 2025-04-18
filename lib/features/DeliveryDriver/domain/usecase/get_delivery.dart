import 'package:delivery_driver/features/DeliveryDriver/domain/entity/delivery_entity.dart';
import 'package:delivery_driver/features/DeliveryDriver/domain/repository/delivery_repository.dart';

class GetDeliveryUseCase {
  final DeliveryRepository repository;

  // Constructor injecting the repository
  GetDeliveryUseCase(this.repository);

  // Execute method to fetch delivery s
  Future<List<DeliveryEntity>> execute() async {
    try {
      // Fetching the list of delivery s from the repository
      return await repository.getDelivery();
    } catch (e) {
      // Handle any errors, e.g., network failure, no data, etc.
      throw Exception('Error fetching delivery s: $e');
    }
  }
}
