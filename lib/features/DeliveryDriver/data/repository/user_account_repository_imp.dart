// repositories/user_profile_repository.dart

//import 'dart:convert';
import 'package:delivery_driver/features/DeliveryDriver/domain/entity/user_account_entity.dart';
import 'package:delivery_driver/features/DeliveryDriver/domain/repository/user_account_repository.dart';
import 'package:delivery_driver/features/DeliveryDriver/data/source/user_account_data_source.dart';
//import 'package:http/http.dart' as http;


class UserAccountRepositoryImpl implements UserAccountRepository {
  final UserAccountDataSource remoteDataSource;

  UserAccountRepositoryImpl(this.remoteDataSource);
  @override
  Future<UserAccountEntity> fetchUserAccount() async {
    final userAccount = await remoteDataSource.fetchUserAccount();

    //final response = await remoteDataSource.fetchUserAccount();
    return userAccount.toEntity();
  }
}