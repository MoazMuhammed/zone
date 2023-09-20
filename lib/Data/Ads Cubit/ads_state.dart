part of 'ads_cubit.dart';

@immutable
abstract class AdsState {}

class AdsInitial extends AdsState {}
class AdsLoading extends AdsState {}
class AdsSuccess extends AdsState {
  final String successMessage;

  AdsSuccess(this.successMessage);

}
class AdsFailure extends AdsState {
  final String failureMessage;

  AdsFailure(this.failureMessage);

}