import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zone/Core/Api/endPoints.dart';
import 'package:zone/Core/Api/my_dio.dart';
import 'package:zone/Models/Feature/feature_model.dart';

part 'feature_state.dart';

class FeatureCubit extends Cubit<FeatureState> {
  FeatureCubit() : super(FeatureInitial());
  List<FeatureModel> featureModel = [];

  getFeature() async {
    emit(FeatureLoading());
    var response = await MyDio.get(endPoint: EndPoints.productsFeature);
    List  data = [];
    print(response!.data);
    data = response.data;
    featureModel = data
        .map((postJson) => FeatureModel.fromJson(postJson))
        .toList()
        .toList();
    print(response);
    emit(FeatureSuccess("successMessage"));
  }
}
