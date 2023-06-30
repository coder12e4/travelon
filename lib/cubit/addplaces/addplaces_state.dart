part of 'addplaces_cubit.dart';

@immutable
abstract class AddplacesState {}

class AddplacesInitial extends AddplacesState {}
class AddplacesLoading extends AddplacesState {}
class AddplacesSuccess extends AddplacesState {
  final addplaceModel obj;
  AddplacesSuccess(this.obj);
}
class AddplacesError extends AddplacesState {}
