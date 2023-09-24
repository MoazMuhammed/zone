import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zone/Core/Api/endPoints.dart';
import 'package:zone/Core/Api/my_dio.dart';
import 'package:zone/Models/cities/cities_model.dart';

part 'cities_state.dart';

class CitiesCubit extends Cubit<CitiesState> {
  CitiesCubit() : super(CitiesInitial());
  List<CitiesModel> citiesModel = [];

  getCities() async {
    emit(CitiesLoading());
    var response = await MyDio.get(endPoint: EndPoints.cities);
    List  data = [];
    print(response!.data);
    data = response.data;
    citiesModel = data
        .map((postJson) => CitiesModel.fromJson(postJson))
        .toList()
        .toList();
    print(response);
    emit(CitiesSuccess("successMessage"));
  }

}
