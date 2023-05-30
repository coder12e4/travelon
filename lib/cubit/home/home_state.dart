part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}
class HomeSuccess extends HomeState {
  final nearbyModel objnearby;

  HomeSuccess(this.objnearby);
}
class HomeError extends HomeState {}
