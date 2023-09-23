import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zone/Core/Api/endPoints.dart';
import 'package:zone/Core/Api/my_dio.dart';
import 'package:zone/Models/register_model/register_model.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  RegisterModel signUpModel = RegisterModel();

  userRegister(
      {required String username,
        required String email,
        required String phone,
        required String password,
        required String device_token,
      }) async {
    var response = await MyDio.postLogin(endPoint: EndPoints.register, data: {
      "name": username,
      "email": email,
      "phone": phone,
      "password": password,
      "device_token": device_token,
    });
    print(response!.statusCode);
    try{
      signUpModel = RegisterModel.fromJson(response.data);
      if( response.statusCode == 201 ) {
        emit(RegisterSuccess(signUpModel.message.toString()));
        print(signUpModel.message);
        Fluttertoast.showToast(
            msg: response.data.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,

            textColor: Colors.black,
            fontSize: 14.sp
        );
      }
      if(response.statusMessage!.isEmpty) {
        emit(RegisterFailure('Data Already exist'));
        print(response.data.toString());
        Fluttertoast.showToast(
            msg: "Data Already exist",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 14.sp
        );
      }
    }catch(e){
      emit(RegisterFailure('Data Already '));
      print(e);
      Fluttertoast.showToast(
          msg: 'Data Already ',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 14.sp
      );
    }
  }
}
