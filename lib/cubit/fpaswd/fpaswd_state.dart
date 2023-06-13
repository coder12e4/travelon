part of 'fpaswd_cubit.dart';

@immutable
abstract class FpaswdState {}

class FpaswdInitial extends FpaswdState {}
class FpaswdLoading extends FpaswdState {}
class FpaswdSuccess extends FpaswdState {}
class FpaswdError extends FpaswdState {}
