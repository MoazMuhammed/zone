part of 'delete_acc_cubit.dart';

@immutable
abstract class DeleteAccState {}

class DeleteAccInitial extends DeleteAccState {}
class DeleteAccLoading extends DeleteAccState {}
class DeleteAccSuccess extends DeleteAccState {
  final String successMessage;

  DeleteAccSuccess(this.successMessage);

}
class DeleteAccFailure extends DeleteAccState {
  final String failureMessage;
  DeleteAccFailure(this.failureMessage);
}