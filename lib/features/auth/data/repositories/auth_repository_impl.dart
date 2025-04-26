import 'package:delivery_driver/features/Auth/domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../datasources/token_storage.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final TokenStorage tokenStorage;

  AuthRepositoryImpl(this.remoteDataSource, this.tokenStorage);



  @override
  Future<String> login({
    required String username,
    required String password,
  }) async {
    final token = await remoteDataSource.login(
      username: username,
      password: password,
    );
    await TokenStorage().saveToken(token);
    return token;
  }

  @override
  Future<void> logout() async {
    await TokenStorage().deleteToken();
  }

}



