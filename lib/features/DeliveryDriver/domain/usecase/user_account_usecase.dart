// domain/use_case/user_account_use_case.dart

//import 'package:delivery_driver/features/DeliveryDriver/data/model/user_account_model.dart';

import 'package:delivery_driver/features/DeliveryDriver/domain/repository/user_account_repository.dart';
import 'package:delivery_driver/features/DeliveryDriver/domain/entity/user_account_entity.dart';
class UserAccountUseCase {
  final UserAccountRepository repository;

  UserAccountUseCase({required this.repository});

  /// Fetch user account details using a token
  Future<UserAccountEntity> execute() async {
    try {
      return await repository.fetchUserAccount();
    } catch (e) {
      throw Exception('Error fetching user account: $e');
    }
  }
}


