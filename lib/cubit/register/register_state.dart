part of 'register_cubit.dart';

@immutable
abstract class RegisterState {

}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {

  final registerModel obj;

  RegisterSuccess(this.obj);


}

class RegisterError extends RegisterState {}


class otpRegInitial extends RegisterState{

}
class otpRegLoading extends RegisterState{}
class otpRegSuccess extends RegisterState{

}
class otpRegError extends RegisterState{

}
