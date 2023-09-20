import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zone/Core/Api/endPoints.dart';
import 'package:zone/Core/Api/my_dio.dart';
import 'package:zone/Core/shared_preferences/my_shared.dart';
import 'package:zone/Core/shared_preferences/my_shared_keys.dart';
import 'package:zone/Models/Login/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  LoginModel loginUserModel = LoginModel();

  userUserLogin({required String email, required String password,required String device_name}) async {
    emit(LoginLoading());
    var response = await MyDio.postLogin(
        endPoint: EndPoints.login,
        data: {"email": email, "password": password,"device_name" : device_name});
    try {
      loginUserModel = LoginModel.fromJson(response!.data);
      if (loginUserModel.status == 200) {
        emit(LoginSuccess(loginUserModel.token.toString()));
        saveUserData();

        Fluttertoast.showToast(
            msg: "${loginUserModel.message}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 14.sp
        );

        print(response.data);
        await saveUserData();
        print(MyShared.getString(key: MySharedKeys.apiToken));
      } if(loginUserModel.status != 200) {
        emit(LoginFailure(loginUserModel.message.toString()));
        Fluttertoast.showToast(
            msg: "${loginUserModel.message}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 14.sp
        );
        print(response.data);


      }
    } catch (e) {
      emit(LoginFailure(loginUserModel.message.toString()));
      print(e);
      Fluttertoast.showToast(
          msg: "Your Email or password is wrong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 14.sp
      );

    }
  }

  saveUserData(){
    MyShared.putString(key: MySharedKeys.apiToken, value: loginUserModel.token);
  }
}