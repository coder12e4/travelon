part of 'new_pswd_cubit.dart';

@immutable
abstract class NewPswdState {}

class NewPswdInitial extends NewPswdState {}
class NewPswdLoading extends NewPswdState {}
class NewPswdSuccess extends NewPswdState {
  final newPswdModel obj;

  NewPswdSuccess(this.obj);
}
class NewPswdError extends NewPswdState {}
