// lib/core/routes.dart
import 'package:delivery_driver/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:delivery_driver/features/DeliveryDriver/presentation/bloc/user_account_bloc.dart';
import 'package:delivery_driver/features/DeliveryDriver/presentation/screens/home_page.dart';
import 'package:delivery_driver/features/Auth/presentation/screens/login_page.dart';
import 'package:delivery_driver/features/DeliveryDriver/presentation/screens/request_page.dart';
import 'package:delivery_driver/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:delivery_driver/features/DeliveryDriver/presentation/bloc/user_account_event.dart';
import '../features/DeliveryDriver/presentation/screens/account_page.dart';
import '../features/DeliveryDriver/presentation/screens/delivery_page.dart';
import 'dependency_injection.dart' as di;

class AppRoutes {
  static const String splash = '/';
  static const String login = '/sign_in';
  static const String home = '/home';
  static const String delivery = '/delivery';
  static const String request = '/request';
  static const String account = '/account';
}

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => BlocProvider.value(
        value: di.sl<AuthBloc>(),
        child: const SplashScreen(),
      ),
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => BlocProvider.value(
        value: di.sl<AuthBloc>(),
        child: LoginPage(),
      ),
    ),

    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => BlocProvider.value(
        value: di.sl<AuthBloc>(),
        child: HomePage(),
      ),
    ),
    GoRoute(
      path: AppRoutes.delivery,
      builder: (context, state) => BlocProvider.value(
        value: di.sl<AuthBloc>(),
        child: DeliveryPage(),
      ),
    ),
    GoRoute(
      path: AppRoutes.account,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: di.sl<AuthBloc>(),
          ),
          BlocProvider(
            create: (_) => di.sl<UserAccountBloc>()..add(FetchUserAccountEvent()),
          ),
        ],
        child: const AccountPage(),
      ),
    ),

    GoRoute(
      path: AppRoutes.request,
      builder: (context, state) => BlocProvider.value(
        value: di.sl<AuthBloc>(),
        child: RequestPage(),
      ),
    ),
  ],
);// TODO Implement this library.