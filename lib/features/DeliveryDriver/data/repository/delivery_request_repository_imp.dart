import 'package:delivery_driver/features/DeliveryDriver/data/model/delivery_request.dart';
import 'package:delivery_driver/features/DeliveryDriver/data/source/delivery_request_data_source.dart';
import 'package:delivery_driver/features/DeliveryDriver/domain/entity/delivery_request_entity.dart';
import 'package:delivery_driver/features/DeliveryDriver/domain/repository/delivery_request_repository.dart';

class DeliveryRequestRepositoryImp implements DeliveryRequestRepository {
  final DeliveryRequestDataSource remoteDataSource;

  DeliveryRequestRepositoryImp(this.remoteDataSource);

  @override
  Future<List<DeliveryRequestEntity>> getDeliveryRequests() async {
    // Getting the models from the data source
    final List<DeliveryRequest> models = await remoteDataSource.getDeliveryRequests();

    return models.map((m) => m.toEntity()).toList();
  }
}
