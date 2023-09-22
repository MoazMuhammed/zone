import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zone/Core/Api/endPoints.dart';
import 'package:zone/Core/Api/my_dio.dart';
import 'package:zone/Models/normal%20Ads/normal_ads.dart';

part 'normal_ads_state.dart';

class NormalAdsCubit extends Cubit<NormalAdsState> {
  NormalAdsCubit() : super(NormalAdsInitial());
  List<NormalAds> normalAds = [];

  getNormalAds() async {
    emit(NormalAdsLoading());
    var response = await MyDio.get(endPoint: EndPoints.adsNormal);
    List  data = [];
    print(response!.data);
    data = response.data;
    normalAds = data
        .map((postJson) => NormalAds.fromJson(postJson))
        .toList()
        .toList();
    emit(NormalAdsSuccess("successMessage"));
  }
}
