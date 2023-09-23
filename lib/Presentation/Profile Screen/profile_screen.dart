import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zone/Core/Widget/getting_soon_widget.dart';
import 'package:zone/Core/navigators/navigators.dart';
import 'package:zone/Core/style/color.dart';
import 'package:zone/Data/Data%20Profile%20Cubit/data_profile_cubit.dart';
import 'package:zone/Data/logout/logout_cubit.dart';
import 'package:zone/Presentation/Profile%20Screen/settings/settings.dart';
import 'package:zone/generated/l10n.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final cubit = LogoutCubit();
  final cubitDataUser = DataProfileCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => cubitDataUser..getUserDetails(),
  child: BlocBuilder<DataProfileCubit, DataProfileState>(
  builder: (context, state) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        foregroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Image.asset(
              'assets/images/profile.png',
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.37,
              ),
              Container(
                width: double.infinity,
                decoration:  BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(45),
                    topLeft: Radius.circular(45),
                  ),
                  gradient: RadialGradient(
                    colors: [
                      Theme.of(context).brightness == Brightness.light
                          ? Colors.white
                          : const Color(0xff2e2e2e),
                      Theme.of(context).brightness == Brightness.light
                          ? Colors.white
                          : const Color(0xff2e2e2e),
                      Theme.of(context).brightness == Brightness.light
                          ? Colors.white
                          : const Color(0xff2e2e2e),
                    ],
                    center: Alignment.topLeft,
                    focal: Alignment.center,
                    focalRadius: 4,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                       cubitDataUser.userData.name,
                       style: TextStyle(
                         color:  Theme.of(context).brightness == Brightness.light
                             ? Colors.black
                             : Colors.white,
                         fontWeight: FontWeight.bold,
                         fontSize: 32.0,
                       ),
                          ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.30,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color:  Theme.of(context).brightness == Brightness.light
                            ? AppColors.zoneColor1
                            : AppColors.zoneColor1,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow:  [
                          BoxShadow(
                            color:  Theme.of(context).brightness == Brightness.light
                                ? Colors.white
                                : Colors.white10,
                            blurRadius: 10,
                            spreadRadius: 0.1,
                            offset: const Offset(0, 7),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                getProfileElement(
                                  context: context,
                                  targetedWidget: const GettingSoon(),
                                  icon: Icons.favorite_outline,
                                  title: S().favourite, onPressed: () {     push(context, const GettingSoon());
                                },
                                ),
                                getProfileElement(
                                  context: context,
                                  targetedWidget: const GettingSoon(),
                                  icon: Icons.local_offer,
                                  title: S().offers, onPressed: () {  },
                                ),
                                getProfileElement(
                                  context: context,
                                  targetedWidget: const GettingSoon(),
                                  icon: Icons.card_giftcard,
                                  title: S().voucher, onPressed: () {
                                  push(context, const GettingSoon());

                                },
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: AppColors.productElement1,
                            width: double.infinity,
                            height: 2,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                getProfileElement(
                                  context: context,
                                  targetedWidget: const GettingSoon(),
                                  icon: Icons.location_on,
                                  title: S().address, onPressed: () {
                                  push(context, const GettingSoon());

                                },
                                ),
                                getProfileElement(
                                  context: context,
                                  targetedWidget: const GettingSoon(),
                                  icon: Icons.checklist_rtl,
                                  title: S().pastOrder, onPressed: () {
                                  push(context, const GettingSoon());

                                },
                                ),
                                getProfileElement(
                                  context: context,
                                  targetedWidget: const SettingsScreen(),
                                  icon: Icons.settings,
                                  title: S().settings, onPressed: () {
                                    push(context, const SettingsScreen());
                                },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  },
),
);
  }
}

Widget getProfileElement(
    {required BuildContext context,
    required IconData icon,
    required String title,
    required Widget targetedWidget,required VoidCallback onPressed}) {
  return GestureDetector(
    onTap: onPressed,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(icon, color: Colors.white),
        ),
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        )
      ],
    ),
  );
}
