import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';
import 'package:zone/Core/Widget/getting_soon_widget.dart';
import 'package:zone/Core/shared_preferences/my_shared.dart';
import 'package:zone/Core/shared_preferences/my_shared_keys.dart';
import 'package:zone/Core/style/color.dart';
import 'package:zone/Data/Main%20Screen%20Cubit/main_screen_cubit.dart';
import 'package:zone/Presentation/Home%20Screen/home_screen.dart';
import 'package:zone/Presentation/Login%20And%20Register/login_register_screen.dart';
import 'package:zone/Presentation/Profile%20Screen/profile_screen.dart';
import 'package:zone/generated/l10n.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainScreenCubit cubit = MainScreenCubit();
  int index = 0;

  List<Widget> listScreens = [
    const HomeScreen(),
    const GettingSoon(),
    const GettingSoon(),
    MyShared.getString(key: MySharedKeys.apiToken).isEmpty
        ? const LoginAndRegisterScreen()
        : const ProfileScreen(),  ];


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<MainScreenCubit, MainScreenState>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: cubit.screens[cubit.index],
              bottomNavigationBar: ResponsiveNavigationBar(
                navigationBarButtons:  [
                   NavigationBarButton(
                    padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 12),
                    text: S().home,
                    icon: Icons.home,
                    backgroundColor: AppColors.zoneColor1,
                  ),
                   NavigationBarButton(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                      text: S().currentOrder,
                      icon: Icons.list_alt,
                      backgroundColor: AppColors.zoneColor1),
                   NavigationBarButton(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                      text: S().notification,
                      icon: Icons.notifications,
                      backgroundColor: AppColors.zoneColor1),
                  NavigationBarButton(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                      text: MyShared.getString(key: MySharedKeys.apiToken).isEmpty?S().login:S().profile,
                      icon: MyShared.getString(key: MySharedKeys.apiToken).isEmpty?Icons.login:Icons.person,
                      backgroundColor: AppColors.zoneColor1),
                ],
                borderRadius: 25,
                selectedIndex: cubit.index,
                backgroundOpacity: 0.6,
                onTabChange: (page) {
                  cubit.index = page;
                  setState(() {});
                },
                fontSize: 16,
                textStyle: const TextStyle(color: Colors.white),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                outerPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              ),
            ),
          );
        },
      ),
    );
  }
}
