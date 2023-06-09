part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {

  final String name;
  final String email;
  final String address;
  final int pin;
  var dob;
  final int mob;
  final String BG;
  var passWord;
  var Confirmpassword;
  RegisterSuccess(
      this.name, this.email, this.address, this.pin, this.mob, this.BG);



}

class RegisterError extends RegisterState {}


class RegInitial extends RegisterState{

}
class RegLoading extends RegisterState{}
class RegSuccess extends RegisterState{
  final registerModel obj;

  RegSuccess(this.obj);
}
class RegError extends RegisterState{

}
