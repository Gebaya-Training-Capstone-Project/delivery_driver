import 'package:delivery_driver/features/Auth/data/datasources/token_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/login.dart';
import '../../domain/usecases/logout.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Login login;
  final Logout logout;

  AuthBloc({
    required this.login,
    required this.logout,

  }) : super(AuthInitial()) {
    on<LoginEvent>(_onLogin);
    on<LogoutEvent>(_onLogout);
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {

    print("hi");
    emit(AuthLoading());
    try {
      final token = await login.execute(
        username: event.username,
        password: event.password,
       );
      await TokenStorage().saveToken(token);
      emit(AuthAuthenticated(token));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
    print("hi2");
  }

  Future<void> _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await logout.execute();
      await TokenStorage().deleteToken();
      emit(AuthUnauthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}