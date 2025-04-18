import 'package:delivery_driver/features/DeliveryDriver/data/model/delivery.dart';
import 'package:delivery_driver/features/DeliveryDriver/data/source/delivery_data_source.dart';
import 'package:delivery_driver/features/DeliveryDriver/domain/entity/delivery_entity.dart';
import 'package:delivery_driver/features/DeliveryDriver/domain/repository/delivery_repository.dart';

class DeliveryRepositoryImp implements DeliveryRepository {
  final DeliveryDataSource remoteDataSource;

  DeliveryRepositoryImp(this.remoteDataSource);

  @override
  Future<List<DeliveryEntity>> getDelivery() async {
    // Getting the models from the data source
    final List<Delivery> models = await remoteDataSource.getDelivery();

    // Convert models to entities
    return models.map((model) => model.toEntity()).toList();
  }
}
