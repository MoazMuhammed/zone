import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:zone/Core/shared_preferences/my_shared.dart';
import 'package:zone/Core/shared_preferences/my_shared_keys.dart';
import 'package:zone/Core/style/color.dart';
import 'package:zone/Core/utilies/easy_loading.dart';
import 'package:zone/Data/Cities%20Cubit/cities_cubit.dart';
import 'package:zone/Data/Data%20Profile%20Cubit/data_profile_cubit.dart';
import 'package:zone/Data/Login%20Cubit/login_cubit.dart';
import 'package:zone/Data/Updata%20Data%20User%20Cubit/update_data_user_cubit.dart';
import 'package:zone/Models/cities/cities_model.dart';
import 'package:zone/Presentation/Profile%20Screen/Drop%20DownMenue/dropDownMenue.dart';

class AccountInfoScreen extends StatefulWidget {
  const AccountInfoScreen({super.key});

  @override
  State<AccountInfoScreen> createState() => _AccountInfoScreenState();
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
  final cubit = DataProfileCubit();
  final cubitCities = CitiesCubit();
  final cubitUpdateData = UpdateDataUserCubit();
  bool editable = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  SingleValueDropDownController genderController =
      SingleValueDropDownController();

  @override
  void initState() {
    cubitCities.getCities();
    super.initState();
  }

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
        title: const Text(
          'Account info',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextButton(
              onPressed: () {
                setState(() {
                  editable = true;
                });
              },
              child: const Text(
                'Edit',
                style: TextStyle(color: AppColors.zoneColor1, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
                child: Column(
              children: [
                getBody(),
              ],
            )),
          ),
        ],
      ),
    );
  }

  Widget getBody() {
    return BlocProvider(
      create: (context) => cubit..getUserDetails(),
      child: BlocBuilder<DataProfileCubit, DataProfileState>(
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                getCustomTextField(
                  context: context,
                  textFieldType: 0,
                  labelText: cubit.userData.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  controller: nameController,
                  enabled: editable,
                ),
                getCustomTextField(
                  context: context,
                  textFieldType: 0,
                  labelText: cubit.userData.phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  controller: phoneController,
                  enabled: editable,
                ),
                DropDownTextFormField(
                  validators: (value) {
                    if (value.toString().isEmpty) {
                      return "enter Allergy Type";
                    }
                    return null;
                  },
                  hint: cubit.userData.gender,
                  controller: genderController,
                  enabled: true,
                  count: 2,
                  dropDownList: const [
                    DropDownValueModel(name: "Male", value: "Male"),
                    DropDownValueModel(name: "Female", value: "Female"),
                  ],
                ),
                getCustomTextField(
                    context: context,
                    enabled: editable,
                    icon: GestureDetector(
                        onTap: () async {
                          final selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );

                          if (selectedDate != null) {
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(selectedDate);
                            print(formattedDate);

                            setState(() {
                              birthdateController.text = formattedDate;
                              print(birthdateController.text.toString());
                            });
                          }
                        },
                        child: const Icon(Icons.calendar_month)),
                    textFieldType: 2,
                    labelText: cubit.userData.birthdate == ''
                        ? "Select Your Birthday "
                        : cubit.userData.birthdate,
                    controller: birthdateController,
                    validator: (value) {
                      return null;
                    }),
//                 BlocProvider(
//   create: (context) => cubitCities..citiesModel,
//   child: BlocBuilder<CitiesCubit, CitiesState>(
//   builder: (context, state) {
//
//   return GestureDetector(
//     onTap: () {
//       print(cubitCities.citiesModel.length);
//       MyShared.getString(key: MySharedKeys.apiToken);
//     },
//     child: DropDownTextFormField(
//                     validators: (value) {
//                       if (value.toString().isEmpty) {
//                         return "enter Allergy Type";
//                       }
//                       return null;
//                     },
//                     hint: "Cities",
//                     controller: cityController,
//                     enabled: true,
//                     count: 6,
//                     dropDownList:List.generate(cubitCities.citiesModel.length, (index) {
//                       CitiesModel citiesModel = cubitCities.citiesModel[index];
//
//                       return DropDownValueModel(name: citiesModel.name.toString(), value: citiesModel.id);
//                     }),
//                   ),
//   );
//   },
// ),
// ),
                BlocProvider(
                  create: (context) => cubitUpdateData..updateDataUserModel,
                  child: BlocConsumer<UpdateDataUserCubit, UpdateDataUserState>(
                    listener: (context, state) {
                      if (state is UpdateDataUserLoading) {
                        showLoading();
                      }
                      if (state is UpdateDataUserSuccess) {
                        hideLoading();
                      }
                      if (state is LoginFailure) {
                        hideLoading();
                      }
                    },
                    builder: (context, state) {
                      return getCustomButton(
                          text: 'Save changes',
                          onPressed: (editable)
                              ? () {
                                  if (formKey.currentState!.validate()) {
                                    setState(() {
                                      cubitUpdateData.userUpdate(
                                          username: nameController.text,
                                          gender: "male",
                                          phone: phoneController.text,
                                          birthdate:  birthdateController.text);
                                    });
                                  }
                                }
                              : () {},
                          enabled: editable);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget getCustomButton(
      {required String text,
      required VoidCallback onPressed,
      required bool enabled}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: (enabled) ? AppColors.zoneColor2 : Colors.grey,
        ),
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.08,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
    );
  }
}

Widget getCustomTextField(
    {required BuildContext context,
    required int textFieldType,
    required String labelText,
    required String? Function(String?) validator,
    required TextEditingController controller,
    required bool enabled,
    Widget? icon}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: AppColors.productElement1,
    ),
    width: MediaQuery.of(context).size.width * 0.9,
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
    child: TextFormField(
      enabled: enabled,
      controller: controller,
      keyboardType: (textFieldType == 0)
          ? TextInputType.name
          : (textFieldType == 1)
              ? TextInputType.emailAddress
              : TextInputType.phone,
      validator: validator,
      cursorColor: AppColors.zoneColor1,
      style: TextStyle(
        color: (enabled) ? AppColors.zoneColor2 : Colors.grey,
      ),
      decoration: InputDecoration(
          prefixIcon: icon,
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none),
    ),
  );
}
