part of 'data_profile_cubit.dart';

@immutable
abstract class DataProfileState {}

class DataProfileInitial extends DataProfileState {}
class DataProfileLoading extends DataProfileState {}
class DataProfileSuccess extends DataProfileState {
  final String successMessage;

  DataProfileSuccess(this.successMessage);

}
class DataProfileFailure extends DataProfileState {
  final String failureMessage;
  DataProfileFailure(this.failureMessage);
}