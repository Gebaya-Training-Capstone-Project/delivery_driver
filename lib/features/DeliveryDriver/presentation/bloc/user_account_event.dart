// user_account_event.dart

import 'package:delivery_driver/features/DeliveryDriver/domain/entity/user_account_entity.dart';

abstract class UserAccountEvent {}

class SetUserAccountEvent extends UserAccountEvent {
  final UserAccountEntity userAccount;

  SetUserAccountEvent(this.userAccount);
}

class LoadUserAccountEvent extends UserAccountEvent {}

class FetchUserAccountEvent extends UserAccountEvent {
  FetchUserAccountEvent();
}
