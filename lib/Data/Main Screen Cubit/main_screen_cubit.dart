import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:zone/Core/Widget/getting_soon_widget.dart';
import 'package:zone/Core/shared_preferences/my_shared.dart';
import 'package:zone/Core/shared_preferences/my_shared_keys.dart';
import 'package:zone/Presentation/Home%20Screen/home_screen.dart';
import 'package:zone/Presentation/Login%20And%20Register/login_register_screen.dart';
import 'package:zone/Presentation/Profile%20Screen/profile_screen.dart';

part 'main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit() : super(MainScreenInitial());

  int index = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const GettingSoon(),
    const GettingSoon(),
  MyShared.getString(key: MySharedKeys.apiToken).isEmpty
  ? const LoginAndRegisterScreen()
      : const ProfileScreen(),



  ];

  void backToHome() {
    index = 0;
    emit(BackHomeState());
  }

  void switchToAppointmentScreen() {
    index = 4;
    emit(SwitchToAppointmentScreen());
  }


  void switchToProfileScreen() {
    index = 3;
    emit(SwitchToProfileScreen());
  }

}
