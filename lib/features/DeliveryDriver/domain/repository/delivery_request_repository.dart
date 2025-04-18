import 'package:delivery_driver/features/DeliveryDriver/domain/entity/delivery_request_entity.dart';

abstract class DeliveryRequestRepository {
  Future<List<DeliveryRequestEntity >> getDeliveryRequests();
}// TODO Implement this library.