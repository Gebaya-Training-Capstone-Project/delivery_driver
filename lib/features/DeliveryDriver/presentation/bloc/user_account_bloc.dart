import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:delivery_driver/features/DeliveryDriver/domain/usecase/user_account_usecase.dart';
import 'package:delivery_driver/features/DeliveryDriver/domain/entity/user_account_entity.dart';
import 'user_account_event.dart';
import 'user_account_state.dart';
import 'package:delivery_driver/features/auth/data/datasources/token_storage.dart';

class UserAccountBloc extends Bloc<UserAccountEvent, UserAccountState> {
  final UserAccountUseCase userAccountUseCase;

  UserAccountBloc({required this.userAccountUseCase}) : super(UserAccountInitial()) {
    on<SetUserAccountEvent>((event, emit) async {
      // Save user account data to SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('userName', event.userAccount.name);
      await prefs.setString('userPhone', event.userAccount.phone);
      await prefs.setString('userImageUrl', event.userAccount.imageUrl);

      emit(UserAccountLoaded(event.userAccount));
    });

    on<LoadUserAccountEvent>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      final name = prefs.getString('userName') ?? '';
      final phone = prefs.getString('userPhone') ?? '';
      final imageUrl = prefs.getString('userImageUrl') ?? '';

      emit(UserAccountLoaded(UserAccountEntity(name: name, phone: phone, imageUrl: imageUrl)));
    });

    on<FetchUserAccountEvent>((event, emit) async {
      try {
        final userAccount = await userAccountUseCase.execute();
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('userName', userAccount.name);
        await prefs.setString('userPhone', userAccount.phone);
        await prefs.setString('userImageUrl', userAccount.imageUrl);

        emit(UserAccountLoaded(userAccount));
      } catch (e) {

      }
    });
  }
}


