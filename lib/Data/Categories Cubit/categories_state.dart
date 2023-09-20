part of 'categories_cubit.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}
class CategoriesLoading extends CategoriesState {}
class CategoriesSuccess extends CategoriesState {
  final String successMessage;

  CategoriesSuccess(this.successMessage);

}
class CategoriesFailure extends CategoriesState {
  final String failureMessage;

  CategoriesFailure(this.failureMessage);

}