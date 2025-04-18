import 'package:delivery_driver/features/Auth/domain/repositories/auth_repository.dart';
import 'package:delivery_driver/features/Auth/domain/usecases/login.dart';
import 'package:delivery_driver/features/Auth/domain/usecases/logout.dart';
import 'package:delivery_driver/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../features/auth/data/datasources/auth_remote_datasource.dart';
import '../features/auth/data/datasources/token_storage.dart';
import '../features/auth/data/repositories/auth_repository_impl.dart';


final sl = GetIt.instance;

void init() {
  // Bloc
  sl.registerFactory(
        () => AuthBloc(
      login: sl(),
      logout: sl(),
    ),
  );

  // Use Cases
  sl.registerLazySingleton(() => Login(sl()));
  sl.registerLazySingleton(() => Logout(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(sl(), sl()),
  );

  // Data Sources
  sl.registerLazySingleton(() => AuthRemoteDataSource(sl()));
  sl.registerLazySingleton(() => TokenStorage());

  // External
  sl.registerLazySingleton(() => http.Client());
}