import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zone/Core/Api/endPoints.dart';
import 'package:zone/Core/Api/my_dio.dart';
import 'package:zone/Models/categories/categories_model.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());
  List<CategoriesModel> categoriesModel = [];

  getCategories() async {
    emit(CategoriesLoading());
    var response = await MyDio.get(endPoint: EndPoints.categories);
    List  data = [];
    print(response!.data);
    data = response.data;
    categoriesModel = data
        .map((postJson) => CategoriesModel.fromJson(postJson))
        .toList()
        .toList();
    print(response);
    emit(CategoriesSuccess("successMessage"));
  }
}
