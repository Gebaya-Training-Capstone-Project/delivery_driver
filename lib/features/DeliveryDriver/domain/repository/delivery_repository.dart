import 'package:delivery_driver/features/DeliveryDriver/domain/entity/delivery_entity.dart';

abstract class DeliveryRepository {
  Future<List<DeliveryEntity>> getDelivery();
}
// TODO Implement this library.