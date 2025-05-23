import 'package:delivery_driver/features/Auth/domain/repositories/auth_repository.dart';

class Logout {
  final AuthRepository repository;

  Logout(this.repository);

  Future<void> execute() {
    return repository.logout();
  }
}