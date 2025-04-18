// auth_repository.dart
abstract class AuthRepository {
  Future<String> login({
    required String username,
    required String password,
  });

  Future<void> logout();
}
