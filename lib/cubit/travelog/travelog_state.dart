part of 'travelog_cubit.dart';

@immutable
abstract class TravelogState {}

class TravelogInitial extends TravelogState {}
class TravelogLoading extends TravelogState {}
class TravelogSuccess extends TravelogState {
  final travelogModel objNext;

  TravelogSuccess(this.objNext);
}
class TravelogError extends TravelogState {}
