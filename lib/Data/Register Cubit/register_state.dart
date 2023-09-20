part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class RegisterLoading extends RegisterState {}
class RegisterSuccess extends RegisterState {
  final String successMessage;

  RegisterSuccess(this.successMessage);

}
class RegisterFailure extends RegisterState {
  final String failureMessage;

  RegisterFailure(this.failureMessage);

}
