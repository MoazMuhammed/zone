import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zone/Core/Widget/custom_button.dart';
import 'package:zone/Core/Widget/custom_text_form_field.dart';
import 'package:zone/Core/navigators/navigators.dart';
import 'package:zone/Core/shared_preferences/my_shared.dart';
import 'package:zone/Core/shared_preferences/my_shared_keys.dart';
import 'package:zone/Core/style/color.dart';
import 'package:zone/Core/utilies/easy_loading.dart';
import 'package:zone/Core/utilies/fcm.dart';
import 'package:zone/Data/Login%20Cubit/login_cubit.dart';
import 'package:zone/Data/Register%20Cubit/register_cubit.dart';
import 'package:zone/generated/l10n.dart';
import 'package:zone/main_screen.dart';

class LoginAndRegisterScreen extends StatefulWidget {
  const LoginAndRegisterScreen({super.key});

  @override
  State<LoginAndRegisterScreen> createState() => _LoginAndRegisterScreenState();
}

class _LoginAndRegisterScreenState extends State<LoginAndRegisterScreen> {
  final cubit = RegisterCubit();
  final cubitLogin = LoginCubit();

  Future<void> getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String deviceName = 'Unknown';
    String platform = 'Unknown';

    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        deviceName = androidInfo.model;
        platform = 'Android';
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceName = iosInfo.name;
        platform = 'iOS';
      }
    } catch (e) {
      print('Error getting device info: $e');
    }

    print('Device Name: $deviceName');
    print('Platform: $platform');
  }

  int chosenPage = 0;

  GlobalKey<FormState> form1Key = GlobalKey<FormState>();
  GlobalKey<FormState> form2Key = GlobalKey<FormState>();
  GlobalKey<FormState> form3Key = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController1 = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();
  TextEditingController passwordControllerConfirm = TextEditingController();

  TextEditingController emailController2 = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25,
              child: Center(
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.37,
                    height: MediaQuery.of(context).size.height * 0.18,
                    child: Image.asset(
                      'assets/images/logozone.png',
                      fit: BoxFit.fill,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Text(
                S().title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                S().secondTitle,
                style:
                    const TextStyle(fontSize: 16, color: AppColors.zoneColor2),
              ),
            ),
            form(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  (chosenPage == 0) ? S().haveAccount : S().alreadyHave,
                  style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : Colors.white,
                      fontSize: 14),
                ),
                TextButton(
                    onPressed: (chosenPage == 0)
                        ? () {
                            setState(() {
                              chosenPage = 1;
                            });
                          }
                        : () {
                            setState(() {
                              chosenPage = 0;
                            });
                          },
                    child: Text(
                      (chosenPage == 0) ? S().register : S().login,
                      style: const TextStyle(
                          color: AppColors.zoneColor2, fontSize: 16),
                    ))
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
          ],
        ),
      ),
    );
  }

  Widget form() {
    switch (chosenPage) {
      case 1:
        return Form(
          key: form1Key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextField(
                textFieldType: 0,
                labelText: S().userNAme,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                controller: nameController,
              ),
              CustomTextField(
                  textFieldType: 1,
                  labelText: S().email,
                  controller: emailController,
                  validator: (value) {
                    if (!value!.contains('@') || !value.contains('.com')) {
                      return 'Please enter a valid e-mail!';
                    }
                    return null;
                  }),
              CustomTextField(
                  textFieldType: 2,
                  labelText: S().phone,
                  controller: phoneController1,
                  validator: (value) {
                    if (!value!.startsWith('01')) {
                      return 'Please enter a valid phone number!';
                    }
                    return null;
                  }),
              CustomButton(
                  text: S().next,
                  onPressed: () {
                    if (form1Key.currentState!.validate()) {
                      setState(() {
                        chosenPage = 2;
                      });
                    }
                  })
            ],
          ),
        );
      case 2:
        return BlocProvider(
          create: (context) => cubit,
          child: BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) {
              if (state is RegisterSuccess) {
                showLoading();
                pushAndRemoveUntil(context, const MainScreen());
                hideLoading();
              }
              if (state is RegisterLoading) {
                showLoading();
              }
              if (state is RegisterFailure) {
                showError("Enter a valid email address or password");
              }
              return Form(
                key: form2Key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextField(
                        textFieldType: 3,
                        labelText: S().password,
                        controller: passwordController1,
                        validator: (value) {
                          if (value == null) {
                            return 'This field can not be empty';
                          }
                          return null;
                        }),
                    CustomTextField(
                        textFieldType: 3,
                        labelText: S().confirmPassword,
                        controller: passwordControllerConfirm,
                        validator: (value) {
                          if (value != passwordController1.text) {
                            return 'Password does not match';
                          }
                          return null;
                        }),
                    CustomButton(
                        text: S().register,
                        onPressed: () {
                          PushNotificationService pushNotification =
                              PushNotificationService();
                          pushNotification.initialize().then((value) {
                            if (form2Key.currentState!.validate()) {
                              try {
                                cubit.userRegister(
                                  username: nameController.text,
                                  email: emailController.text.trim(),
                                  password: passwordController1.text.trim(),
                                  phone: phoneController1.text,
                                  device_token: "${pushNotification.fCMToken}",
                                );
                              } catch (e) {
                                Fluttertoast.showToast(
                                    msg:
                                        'Registering can not be processes: \n ${e.toString()}');
                              }
                            }
                          });
                        })
                  ],
                ),
              );
            },
          ),
        );
      default:
        return BlocProvider(
            create: (context) => cubitLogin,
            child: BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginLoading) {
                  showLoading();
                }
                if (state is LoginSuccess) {
                  hideLoading();
                  MyShared.putString(
                          key: MySharedKeys.apiToken,
                          value: cubitLogin.loginUserModel.token.toString())
                      .then((value) {});
                  pushReplacement(context, const MainScreen());
                }
                if (state is LoginFailure) {
                  hideLoading();
                  showError("Email or Password is wrong");
                }
              },
              builder: (context, state) {
                return Form(
                  key: form3Key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextField(
                          textFieldType: 1,
                          labelText: S().email,
                          controller: emailController2,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            } else if (!value.contains('@') ||
                                !value.contains('.com')) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          }),
                      CustomTextField(
                          textFieldType: 3,
                          labelText: S().password,
                          controller: passwordController2,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          }),
                      CustomButton(
                          text: S().login,
                          onPressed: () {
                            if (form3Key.currentState!.validate()) {
                              try {
                                cubitLogin.userUserLogin(
                                    email: emailController2.text,
                                    password: passwordController2.text,
                                    device_name: 'samsung');
                              } catch (e) {
                                Fluttertoast.showToast(
                                    msg: 'Can’t log in: \n ${e.toString()}');
                              }
                            }
                          })
                    ],
                  ),
                );
              },
            ));
    }
  }
}
