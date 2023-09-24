import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zone/Core/Api/endPoints.dart';
import 'package:zone/Core/Api/my_dio.dart';
import 'package:zone/Models/delete%20acc/delete_account.dart';

part 'delete_acc_state.dart';

class DeleteAccCubit extends Cubit<DeleteAccState> {
  DeleteAccCubit() : super(DeleteAccInitial());
  DeleteAccount deleteAccount = DeleteAccount();

  deleteAcc() async {
    emit(DeleteAccLoading());
      var response = await MyDio.post(endPoint: EndPoints.deleteUser);
      try{
        if(response!.statusCode == 200){
          emit(DeleteAccSuccess(response!.data));
          print(response!.data);
          Fluttertoast.showToast(
              msg: deleteAccount.message,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.white,
              textColor: Colors.black,
              fontSize: 14.sp
          );
        }

      }catch(e){
        Fluttertoast.showToast(
            msg: deleteAccount.message,
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
