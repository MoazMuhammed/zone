import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zone/Core/Api/endPoints.dart';
import 'package:zone/Core/Api/my_dio.dart';
import 'package:zone/Models/ads/ads.dart';

part 'ads_state.dart';

class AdsCubit extends Cubit<AdsState> {
  AdsCubit() : super(AdsInitial());
  List<Ads> ads = [];

  getPost() async {
    emit(AdsLoading());
    var response = await MyDio.get(endPoint: EndPoints.adsPrimume);
    List  data = [];
    print(response!.data);
    data = response.data;
    ads = data
        .map((postJson) => Ads.fromJson(postJson))
        .toList()
        .toList();
    emit(AdsSuccess("successMessage"));
  }
}