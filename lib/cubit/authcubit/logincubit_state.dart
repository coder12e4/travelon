part of 'logincubit_cubit.dart';
@immutable
abstract class LogincubitState {}
class LogincubitInitial extends LogincubitState {}
class LogincubitLoading extends LogincubitState {}

class LogincubitSuccess extends LogincubitState {
  final loginModel loginobj;
  LogincubitSuccess(this.loginobj);
}

class LogincubitError extends LogincubitState {}
