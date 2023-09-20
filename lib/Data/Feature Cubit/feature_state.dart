part of 'feature_cubit.dart';

@immutable
abstract class FeatureState {}

class FeatureInitial extends FeatureState {}
class FeatureLoading extends FeatureState {}
class FeatureSuccess extends FeatureState {
  final String successMessage;

  FeatureSuccess(this.successMessage);

}
class FeatureFailure extends FeatureState {
  final String failureMessage;

  FeatureFailure(this.failureMessage);

}