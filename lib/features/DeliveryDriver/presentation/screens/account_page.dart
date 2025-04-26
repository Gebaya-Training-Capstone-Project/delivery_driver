// lib/features/auth/presentation/pages/home_page.dart
import 'package:delivery_driver/core/router.dart';
import 'package:delivery_driver/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:delivery_driver/features/Auth/presentation/bloc/auth_event.dart';
import 'package:delivery_driver/features/Auth/presentation/bloc/auth_state.dart';
import 'package:delivery_driver/features/DeliveryDriver/presentation/bloc/user_account_bloc.dart';
import 'package:delivery_driver/features/DeliveryDriver/presentation/bloc/user_account_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double availableHeight = screenHeight - 110;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        debugPrint('Current auth state: $state');
        if (state is AuthUnauthenticated) {
          context.go(AppRoutes.login);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Eshi - Account'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                context.read<AuthBloc>().add(LogoutEvent());
              },
            ),
          ],
          toolbarHeight: 50,
        ),
        body: BlocBuilder<UserAccountBloc, UserAccountState>(
          builder: (context, state) {
            if (state is UserAccountLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is UserAccountLoaded) {
              // Use the values from the loaded state
              String imageUrl = state.userAccount.imageUrl;
              String name = state.userAccount.name;
              String phone = state.userAccount.phone;
              return Column(
                children: [
                  Container(
                    width: screenWidth,
                    height: availableHeight,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Stack(
                      children: [
                        //Image
                        Positioned(
                          left: 148,
                          top: 131,
                          child: Container(
                            width: 94,
                            height: 91,
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: const Color(0xFF30E145),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                    width: 94,
                                    height: 91,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(imageUrl),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //Name
                        Positioned(
                          left: 134,
                          top: 231,
                          child: Text(
                            'Driver Name: $name',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 1.40,
                            ),
                          ),
                        ),
                        //Phone
                        Positioned(
                          left: 134,
                          top: 262,
                          child: Text(
                            'Driver Number: $phone',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 1.40,
                            ),
                          ),
                        ),
                        //Menu List
                        Positioned(
                          left: 25,
                          top: 300,
                          child: AccountSettingsCard(),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else if (state is UserAccountError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return Center(child: Text('No user account data'));
          },
        ),
        bottomNavigationBar: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Color(0xFF0F8A14),
            boxShadow: [BoxShadow(blurRadius: 10, color: Color(0x0C1FEFFF))],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Image.asset(
                  'assets/icons/order.png',
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                ),
                onPressed: () {
                  context.go('/request');
                },
              ),
              IconButton(
                icon: Image.asset(
                  'assets/icons/home.png',
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                ),

                onPressed: () {
                  context.go('/home');
                },
              ),
              IconButton(
                icon: Image.asset(
                  'assets/icons/account.png',
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                ),
                onPressed: () {
                  context.go('/account');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccountSettingsCard extends StatelessWidget {
  const AccountSettingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double availableHeight = screenHeight - 110;
    Image arrowIcon = Image.asset(
      'assets/icons/arrow-right.png',
      width: 16,
      height: 16,
    );
    return Container(
      width: screenWidth * 0.8,
      height: screenHeight * 0.5,
      padding: const EdgeInsets.all(8),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
          borderRadius: BorderRadius.circular(8),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x0C0C0C0D),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: -1,
          ),
          BoxShadow(
            color: Color(0x190C0C0D),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: -1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
            child: Text(
              'Account Settings',
              style: TextStyle(
                color: const Color(0xFF1E1E1E),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 1.4,
              ),
            ),
          ),

          const Divider(color: Color(0xFFD9D9D9), thickness: 1),

          // Settings List
          const SizedBox(height: 8),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SettingsItem(
                  title: 'Personal Info',
                  leading: Image.asset(
                    'assets/icons/PersonalInfo.png',
                    width: 16,
                    height: 16,
                  ),
                  trailing: arrowIcon,
                ),
                SettingsItem(
                  title: 'Address Location',
                  leading: Image.asset(
                    'assets/icons/Adress.png',
                    width: 16,
                    height: 16,
                  ),
                  trailing: arrowIcon,
                ),
                SettingsItem(
                  title: 'Payment',
                  leading: Image.asset(
                    'assets/icons/payment.png',
                    width: 16,
                    height: 16,
                  ),
                  trailing: arrowIcon,
                ),
                SettingsItem(
                  title: 'Privacy Policy',
                  leading: Image.asset(
                    'assets/icons/privacy.png',
                    width: 16,
                    height: 16,
                  ),
                  trailing: arrowIcon,
                ),
                SettingsItem(
                  title: 'Help',
                  leading: Image.asset(
                    'assets/icons/help.png',
                    width: 16,
                    height: 16,
                  ),
                  trailing: arrowIcon,
                ),
              ],
            ),
          ),

          const Divider(color: Color(0xFFD9D9D9), thickness: 1),
        ],
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final String title;
  final Widget? leading;
  final Widget? trailing;

  const SettingsItem({
    super.key,
    required this.title,
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(
          children: [
            leading ?? const SizedBox(width: 24, height: 24),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF1E1E1E),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                ),
              ),
            ),
            trailing ?? const SizedBox(width: 24, height: 24),
          ],
        ),
      ),
    );
  }
}
