// lib/main.dart
import 'package:delivery_driver/core/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/dependency_injection.dart' as di;
import 'features/auth/presentation/bloc/auth_bloc.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<AuthBloc>(),
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'EshiDelivery',
            theme: ThemeData(
              primarySwatch: Colors.green,
            ),
            routerConfig: router,
          );
        },
      ),
    );
  }
}
