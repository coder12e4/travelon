part of 'getcurrent_location_cubit.dart';

@immutable
abstract class GetcurrentLocationState {}

class GetcurrentLocationInitial extends GetcurrentLocationState {}
class GetcurrentLocationLoading extends GetcurrentLocationState {}
class GetcurrentLocationSuccess extends GetcurrentLocationState {}
class GetcurrentLocationError extends GetcurrentLocationState {}
