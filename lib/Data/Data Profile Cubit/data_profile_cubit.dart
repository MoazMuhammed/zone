import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zone/Core/Api/endPoints.dart';
import 'package:zone/Core/Api/my_dio.dart';
import 'package:zone/Models/data%20profile/data_profile.dart';

part 'data_profile_state.dart';

class DataProfileCubit extends Cubit<DataProfileState> {
  DataProfileCubit() : super(DataProfileInitial());
  DataProfile userData = DataProfile();

  getUserDetails()async{
    try {
      emit(DataProfileLoading());

      var response = await MyDio.post(endPoint: EndPoints.dataProfile);

      userData = DataProfile.fromJson(response!.data);
      print(userData.name);
      emit(DataProfileSuccess(response.data));

    } catch (e) {
      emit(DataProfileFailure(e.toString()));
    }
  }
}