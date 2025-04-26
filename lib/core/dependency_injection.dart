import 'package:delivery_driver/features/Auth/domain/repositories/auth_repository.dart';
import 'package:delivery_driver/features/Auth/domain/usecases/login.dart';
import 'package:delivery_driver/features/Auth/domain/usecases/logout.dart';
import 'package:delivery_driver/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:delivery_driver/features/DeliveryDriver/data/repository/user_account_repository_imp.dart';
import 'package:delivery_driver/features/DeliveryDriver/domain/entity/user_account_entity.dart';
import 'package:delivery_driver/features/DeliveryDriver/domain/repository/user_account_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:delivery_driver/features/DeliveryDriver/presentation/bloc/user_account_bloc.dart';
import 'package:delivery_driver/features/DeliveryDriver/domain/usecase/user_account_usecase.dart';
import 'package:delivery_driver/features/DeliveryDriver/data/source/user_account_data_source.dart';
import '../features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:delivery_driver/features/auth/data/datasources/token_storage.dart';
import '../features/auth/data/repositories/auth_repository_impl.dart';

final sl = GetIt.instance;

void init() {
  print("Initializing GetIt...");
  // ✅ Register TokenStorage first
  sl.registerLazySingleton<TokenStorage>(() => TokenStorage());
  print("Initializing token di...");
  // ✅ Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSource(sl()));
  sl.registerLazySingleton<UserAccountDataSource>(() => UserAccountDataSource());
  print("Initializing data source di...");
  // ✅ Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton<UserAccountRepository>(() => UserAccountRepositoryImpl(sl()));
  print("Initializing usecase di...");
  // ✅ Use Cases
  sl.registerLazySingleton(() => Login(sl()));
  sl.registerLazySingleton(() => Logout(sl()));
  sl.registerLazySingleton(() => UserAccountUseCase(repository: sl()));
  print("Initializing  http di...");
  // ✅ Register http.Client as a lazy singleton
  sl.registerLazySingleton(() => http.Client());
  print("Initializing bloc di...");
  // ✅ BLoCs
  sl.registerFactory(() => AuthBloc(
    login: sl(),
    logout: sl(),
  ));
  sl.registerFactory(() => UserAccountBloc(
    userAccountUseCase: sl(),
  ));
  print(sl.isRegistered<AuthBloc>());
}
