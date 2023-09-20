import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:zone/Core/Languge/language_cubit.dart';
import 'package:zone/Core/Widget/getting_soon_widget.dart';
import 'package:zone/Core/navigators/navigators.dart';
import 'package:zone/Core/shared_preferences/my_shared.dart';
import 'package:zone/Core/shared_preferences/my_shared_keys.dart';
import 'package:zone/Core/style/color.dart';
import 'package:zone/Core/style/themes.dart';
import 'package:zone/Data/logout/logout_cubit.dart';
import 'package:zone/generated/l10n.dart';
import 'package:zone/main_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notificationsAllowed = true;
  final cubit = LogoutCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          foregroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title:  Text(
            'Settings',
            style: TextStyle(fontWeight: FontWeight.bold, color:  Theme.of(context).brightness == Brightness.light
                ? Colors.black
                : Colors.white,),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon:  Icon(
                Icons.arrow_back,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              )),
        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.12,
            ),
            getProfileElement(
                context: context,
                title: '${S().accountInfo}',
                trailing: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: IconButton(
                      onPressed: () {
push(context, GettingSoon());                      },
                      icon: Icon(Icons.arrow_forward_ios,
                          color: AppColors.zoneColor1)),
                )),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
              child: Divider(
                height: 2,
                color: AppColors.productElement2,
              ),
            ),
            getProfileElement(
                context: context,
                title: '${S().changePassword}',
                trailing: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: IconButton(
                      onPressed: () {
    push(context, GettingSoon());

  },
                      icon: Icon(Icons.arrow_forward_ios,
                          color: AppColors.zoneColor1)),
                )),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
              child: Divider(
                height: 2,
                color: AppColors.productElement2,
              ),
            ),
            getProfileElement(
                context: context,
                title: '${S().lang}',
                trailing: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: IconButton(
                      onPressed: () {
                        showDialog(context: context, builder: (context) {
                       return   AlertDialog(
                            // <-- SEE HERE
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20.sp))),
                            contentPadding: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 12.sp),
                            content: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 15.sp),
                              height: 16.h,
                              child: Column(
                                children: [
                                  Center(
                                    child: TextButton(
                                      onPressed: () {
                                        this.context.read<LanguageCubit>().changeLanguageToEn();
                                        pop(context);

                                      },
                                      child: Text("English", style: TextStyle(color: Theme.of(context).brightness == Brightness.light
                                          ? Colors.black
                                          : Colors.white,fontWeight: FontWeight.bold,fontSize: 16.sp),),
                                    ),
                                  ),

                                  Center(
                                    child: TextButton(
                                      onPressed: () {
                                        this.context.read<LanguageCubit>().changeLanguageToAr();
                                        pop(context);

                                      },
                                      child: Text("Arabic", style: TextStyle(color: Theme.of(context).brightness == Brightness.light
                                          ? Colors.black
                                          : Colors.white,fontWeight: FontWeight.bold,fontSize: 16.sp)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },);
                      },
                      icon: Icon(Icons.arrow_forward_ios,
                          color: AppColors.zoneColor1)),
                )),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
              child: Divider(
                height: 2,
                color: AppColors.productElement2,
              ),
            ),
            getProfileElement(
                context: context,
                title: '${S().country}',
                trailing: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: IconButton(
                      onPressed: () {
  push(context, GettingSoon());

},
                      icon: Icon(Icons.arrow_forward_ios,
                          color: AppColors.zoneColor1)),
                )),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
              child: Divider(
                height: 2,
                color: AppColors.productElement2,
              ),
            ),
            getProfileElement(
                context: context,
                title: '${S().aboutApp}',
                trailing: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: IconButton(
                      onPressed: () {
push(context, GettingSoon());

},
                      icon: Icon(Icons.arrow_forward_ios,
                          color: AppColors.zoneColor1)),
                )),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.08,
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.productElement1
                  : const Color(0xff2e2e2),
            ),
            getProfileElement(
              context: context,
              title: '${S().notification}',
              trailing: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Switch(
                    onChanged: (bool value) {
                      setState(() {
                        notificationsAllowed = value;
                      });
                    },
                    value: notificationsAllowed,
                    activeColor: AppColors.zoneColor1,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Divider(
                height: 2,
                color: AppColors.productElement2,
              ),
            ),
            getProfileElement(
                context: context,
                title: '${S().themeMode}',
                trailing: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Consumer<ThemeProvider>(
                      builder: (context, provider, child) {
                    return ToggleSwitch(
                      initialLabelIndex: provider.currentTheme,
                      totalSwitches: 2,
                      activeBgColor: [Colors.deepPurple],
                      inactiveBgColor:
                          Theme.of(context).brightness == Brightness.light
                              ? Colors.white
                              : Colors.white,
                      customWidths: [25.w, 25.w],
                      labels: ['${S().light}', '${S().dark}'],
                      borderColor: [
                        Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Colors.white
                      ],
                      inactiveFgColor:
                          Theme.of(context).brightness == Brightness.light
                              ? Colors.black
                              : Colors.black,
                      customIcons: const [
                        Icon(
                          Icons.light_mode,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.dark_mode,
                          color: Colors.black54,
                        )
                      ],
                      onToggle: (int? index) {
                        setState(() {
                          provider.changeTheme(index ?? 0);
                        });
                      },
                    );
                  }),
                )),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
              child: Divider(
                height: 2,
                color: AppColors.productElement2,
              ),
            ),
            BlocProvider(
  create: (context) => cubit,
  child: BlocBuilder<LogoutCubit, LogoutState>(
  builder: (context, state) {
    return getProfileElement(
                context: context,
                title: '${S().logOut}',
                trailing: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: IconButton(
                      onPressed: () {
                        cubit.logout();
                        MyShared.putString(
                            key: MySharedKeys.apiToken,
                            value: '');
                        pushReplacement(context, const MainScreen());

                      },
                      icon: Icon(Icons.logout, color: AppColors.zoneColor1)),
                ));
  },
),
),
            Expanded(
              child: Container(
                width: double.infinity,
                color:  Theme.of(context).brightness == Brightness.light
                    ? AppColors.productElement1
                    : const Color(0xff2e2e2),
              ),
            ),
          ],
        ));
  }
}

Widget getProfileElement(
    {required BuildContext context,
    required String title,
    required Widget trailing}) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              title,
              style:  TextStyle(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          trailing,
        ],
      ),
    ],
  );
}
