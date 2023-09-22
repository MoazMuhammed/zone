import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zone/Core/style/color.dart';
import 'package:zone/Data/Data%20Profile%20Cubit/data_profile_cubit.dart';

class AccountInfoScreen extends StatefulWidget {
  const AccountInfoScreen({super.key});

  @override
  State<AccountInfoScreen> createState() => _AccountInfoScreenState();
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
final cubit = DataProfileCubit();
  bool editable = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController1 = TextEditingController();


  @override
  void initState() {
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
        title: const Text('Account info',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),
        ),
        leading: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back,color: Colors.black,)
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextButton(
              onPressed: () {
                setState(() {
                  editable = false;
                });
              },
              child: const Text(
                'Edit',
                style: TextStyle(
                    color: AppColors.zoneColor1,
                    fontSize: 16
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(child: Column(
              children: [
                getBody(),
              ],
            )),
          ),
        ],
      ),
    );
  }

  Widget getBody(){
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
            textFieldType: 0, labelText: cubit.userData.name, validator: (value){
            if(value!.isEmpty){
              return 'Please enter your name';
            }
            return null;
          },controller: nameController,
            enabled: editable,
          ),
          getCustomTextField(
              context: context,
              enabled: editable,
              textFieldType: 1, labelText: cubit.userData.email,controller: emailController ,validator: (value){
            if(! value!.contains('@')||!value.contains('.com')){
              return 'Please enter a valid e-mail!';
            }
            return null;
          }),
          getCustomTextField(
              context: context,
              enabled: editable,
              textFieldType: 2, labelText:cubit.userData.phone,controller: phoneController1,validator: (value){
            if(! value!.startsWith('01')){
              return 'Please enter a valid phone number!';
            }
            return null;
          }),
          getCustomButton(
              text: 'Save changes',
              onPressed: (editable)?(){
                if(formKey.currentState!.validate()){
                  setState(() {
                    editable = false;
                  });
                }
              }:(){},
              enabled: editable
          )
        ],
      ),
    );
  },
),
);

  }

  Widget getCustomButton({required String text, required VoidCallback onPressed,required bool enabled}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: (enabled)?AppColors.zoneColor2:Colors.grey,
        ),
        width: MediaQuery.of(context).size.width*0.9,
        height: MediaQuery.of(context).size.height*0.08,
        padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
        margin: const EdgeInsets.symmetric(vertical: 12,horizontal: 0),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16
            ),
          ),
        ),
      ),
    );
  }
}

Widget getCustomTextField({
  required BuildContext context,
  required int textFieldType,
  required String labelText,
  required String? Function(String?)  validator,
  required TextEditingController controller,
  required bool enabled
}){
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: AppColors.productElement1,
    ),
    width: MediaQuery.of(context).size.width*0.9,
    padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
    margin: const EdgeInsets.symmetric(vertical: 12,horizontal: 0),
    child: TextFormField(
      enabled: enabled,
      controller: controller,
      keyboardType: (textFieldType == 0)?TextInputType.name:
      (textFieldType == 1)?TextInputType.emailAddress:
      TextInputType.phone,
      validator: validator,
      cursorColor: AppColors.zoneColor1,
      style: TextStyle(
        color: (enabled)?AppColors.zoneColor2:Colors.grey,
      ),
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
              color: Colors.grey
          ),
          border: InputBorder.none
      ),
    ),
  );
}