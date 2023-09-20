import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zone/Core/navigators/navigators.dart';
import 'package:zone/Core/utilies/app_svp.dart';
import 'package:zone/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  double buttonOpacity = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 2000)).then((value) {
        pushReplacement(context, const MainScreen());
    });

    Future.delayed(
      const Duration(milliseconds: 1500),
          () {
        buttonOpacity = 1;
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedContainer(
                      height: 40.sp,
                      width: 40.sp,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.bounceOut,
                      child: Image.asset('assets/images/logozone.png'),
                    ),
                    SizedBox(height: 1.h,),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
