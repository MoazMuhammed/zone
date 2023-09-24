part of 'update_data_user_cubit.dart';

@immutable
abstract class UpdateDataUserState {}

class UpdateDataUserInitial extends UpdateDataUserState {}
class UpdateDataUserLoading extends UpdateDataUserState {}
class UpdateDataUserSuccess extends UpdateDataUserState {
  final String successMessage;

  UpdateDataUserSuccess(this.successMessage);

}
class UpdateDataUserFailure extends UpdateDataUserState {
  final String failureMessage;

  UpdateDataUserFailure(this.failureMessage);

}
