import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zone/Core/Api/endPoints.dart';
import 'package:zone/Core/Api/my_dio.dart';
import 'package:zone/Models/update%20Data%20User/update_data_user_model.dart';

part 'update_data_user_state.dart';

class UpdateDataUserCubit extends Cubit<UpdateDataUserState> {
  UpdateDataUserCubit() : super(UpdateDataUserInitial());
  UpdateDataUserModel updateDataUserModel = UpdateDataUserModel();

  userUpdate(
      {required String username,
        required String gender,
        required String phone,
        required String birthdate,
      }) async {
    var response = await MyDio.post(endPoint: EndPoints.updateData, data: {
      "name": username,
      "gender": gender,
      "phone": phone,
      "birthdate": birthdate,
    });
    print(response!.data);
    try{
      updateDataUserModel = UpdateDataUserModel.fromJson(response.data);
      if( updateDataUserModel.status == 201 ) {
        emit(UpdateDataUserSuccess(updateDataUserModel.message.toString()));
        print(updateDataUserModel.message);
        Fluttertoast.showToast(
            msg: updateDataUserModel.message.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,

            textColor: Colors.black,
            fontSize: 14.sp
        );
      }
      if(response.statusMessage != 201) {
        emit(UpdateDataUserFailure(updateDataUserModel.message.toString()));
        Fluttertoast.showToast(
            msg: updateDataUserModel.message.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 14.sp
        );
      }
    }catch(e){
      emit(UpdateDataUserFailure(updateDataUserModel.message.toString()));
      Fluttertoast.showToast(
          msg: updateDataUserModel.message.toString(),
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

