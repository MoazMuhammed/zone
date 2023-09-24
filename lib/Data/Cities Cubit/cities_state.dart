part of 'cities_cubit.dart';

@immutable
abstract class CitiesState {}

class CitiesInitial extends CitiesState {}
class CitiesLoading extends CitiesState {}
class CitiesSuccess extends CitiesState {
  final String successMessage;

  CitiesSuccess(this.successMessage);

}
class CitiesFailure extends CitiesState {
  final String failureMessage;

  CitiesFailure(this.failureMessage);

}