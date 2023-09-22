part of 'normal_ads_cubit.dart';

@immutable
abstract class NormalAdsState {}

class NormalAdsInitial extends NormalAdsState {}
class NormalAdsLoading extends NormalAdsState {}
class NormalAdsSuccess extends NormalAdsState {
  final String successMessage;

  NormalAdsSuccess(this.successMessage);

}
class NormalAdsFailure extends NormalAdsState {
  final String failureMessage;

  NormalAdsFailure(this.failureMessage);

}