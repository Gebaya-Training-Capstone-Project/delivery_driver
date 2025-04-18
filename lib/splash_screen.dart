// lib/features/auth/presentation/pages/splash_screen.dart
import 'dart:async';
import 'package:delivery_driver/core/router.dart';
import 'package:delivery_driver/features/Auth/data/datasources/token_storage.dart';
import 'package:delivery_driver/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:delivery_driver/features/Auth/presentation/bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(
        const Duration(seconds: 3),
            () async {
          if (mounted) {
            final tokenStorage = TokenStorage();
            final token = await tokenStorage.getToken();
            if (token != null) {
              context.read<AuthBloc>().add(LoginEvent(username: '', password: '')); // Trigger login with token
              context.go(AppRoutes.home);
            } else {
              context.go(AppRoutes.login);
            }
          }
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF007929),
      body: Center( // centers content vertically & horizontally
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/eshitapLogo.png', width: 100),
            SizedBox(width: 20),
            Image.asset('assets/images/DriverLogo.png', width: 100),
          ],
        ),
      ),
    );
  }

}