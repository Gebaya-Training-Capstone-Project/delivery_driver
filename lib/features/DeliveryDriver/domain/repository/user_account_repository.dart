//import 'package:delivery_driver/features/DeliveryDriver/data/model/user_account_model.dart';
import 'package:delivery_driver/features/DeliveryDriver/domain/entity/user_account_entity.dart';

abstract class UserAccountRepository {
  Future<UserAccountEntity> fetchUserAccount();

}
