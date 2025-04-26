// user_account_state.dart

import 'package:delivery_driver/features/DeliveryDriver/domain/entity/user_account_entity.dart';

abstract class UserAccountState {}

class UserAccountInitial extends UserAccountState {}

class UserAccountLoading extends UserAccountState {}

class UserAccountLoaded extends UserAccountState {
  final UserAccountEntity userAccount;

  UserAccountLoaded(this.userAccount);
}

class UserAccountError extends UserAccountState {
  final String message;

  UserAccountError(this.message);
}
